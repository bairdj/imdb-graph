#!/bin/bash
service neo4j stop
rm -r /var/lib/neo4j/data/databases
rm -r /var/lib/neo4j/data/transactions
neo4j-admin import --nodes=Person=./headers/name.basics.tsv,./data/name.basics.tsv \
	--nodes=Title=./headers/title.basics.tsv,./data/title.basics.tsv \
	--relationships=APPEARED_IN=./headers/title.principals.tsv,./data/title.principals.tsv \
	--relationships=EPISODE_OF=./headers/title.episode.tsv,./data/title.episode.tsv \
	--delimiter="\009" --quote="\1" --skip-bad-relationships=true
chown -R neo4j:neo4j /var/lib/neo4j/data
service neo4j start

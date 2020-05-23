#!/bin/bash
wget -i download_uri.txt --directory-prefix=data -N
gzip -rdkf data

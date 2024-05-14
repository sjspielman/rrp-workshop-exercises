#!/bin/bash

# set some script options
set -euo pipefail

# Define file names
FASTQ_R1="subset-SRR11518889_1.fastq.gz"
FASTQ_R2="subset-SRR11518889_2.fastq.gz"
FASTQ_URL="https://raw.githubusercontent.com/AlexsLemonade/reproducible-research/main/instructor_notes/fastq_subset"

#FASTQ_R1_URL=${FASTQ_URL}/${FASTQ_R1}

# Define and create, as needed, the data destination directory
DATA_DIR="../data/raw/fastq/study"
mkdir -p ${DATA_DIR}

##### Process the R1 file ######
echo "Obtaining ${FASTQ_R1}"

# curl with the -O flag to preserve the file's name
# aka keep the same name that it had on the internet when on my computer
# otherwise, I'll forget the file name
curl -O ${FASTQ_URL}/${FASTQ_R1}

# print out the number of lines
echo "The number of lines in ${FASTQ_R1} file is:"
gunzip -c ${FASTQ_R1} | wc -l  # use pipe to avoid actually making an uncompressed file

# Move to final home!
mv ${FASTQ_R1} ${DATA_DIR}


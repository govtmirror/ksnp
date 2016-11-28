#!/usr/bin/env bash

# set working directory to <analysis>/run directory with kSNP analysis output files
# Analysis done using a reference to annotated is needed
# uses parsimony files
# using tree_AlleleCounts.parsimony.tre, find a node to target.  In figtree after tree is opened check "Node Labels", then display as "label".  The first number at the node is the group the second number is the SNP count for the branch.
# Argument $1 is the targeting group

if [ -z "$1" ]; then
    echo "Argument was not provide, please read header for help"
    exit 1
fi

if [ -z "$2" ]; then
    echo "Give full path to vcfs"
    exit 1
fi

# if file is zero in size exit or file does not exists
if [ -s SNP_annotations ]; then
    echo "SNP_annotations exists and is greater than zero"
else
    echo "checking your working directory or SNP_annotations file"
    exit 1
fi

positions=`grep "Internal.Node.${1}" ClusterInfo.parsimony | wc -l | tr -d [:space:]`

echo "There are $positions SNPs for node: ${1}"

read -p "Press Enter if this is correct"

grep "Internal.Node.${1}" ClusterInfo.parsimony | awk '$3 == 1 {print $2}' > snp_context_list_node-${1}.txt
vcf_path=${2}
echo "vcf_path: $vcf_path"
for i in `cat snp_context_list_node-${1}.txt`; do
    position=`grep "$i" SNP_annotations | awk '{print $10}'`
    echo "*** position: $position"
    awk -v var=$position '$2==var {print FILENAME, $0}' ${vcf_path}/*
    totalingroup=$(awk -v var=$position '$2==var {print FILENAME, $0}' ${vcf_path}/*)
    printf "\n\nAt position $position of node $1 there are $totalingroup samples\n\n"
    read -p "Press Enter to continue through SNP list"
done


echo "*** Done"
# 2016-11-28 stuber

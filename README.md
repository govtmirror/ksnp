##kSNP

##OVERVIEW

kSNP is open sourced and available at:   
https://sourceforge.net/projects/ksnp/files/

kSNP was developed by Shea Gardner, Tom Slezak and Barry Hall   
http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0081760  
http://bioinformatics.oxfordjournals.org/content/early/2015/05/16/bioinformatics.btv271.full.pdf

This repository is an effort to continue development on the great work already done.

kSNP is an easy-to-use reference free SNP caller.  Its application is for viral and bacterial genomes.  Input can be raw FASTQ reads, draft assembles and/or finished assembles.  Upon completion over 60 files are output.  These files vary by SNP type, tree type and file type.

##GOALS OF THIS REPOSITORY

- Environment for continued development
- Provide additional documentation and commenting of source files
- Collaboration

##DEVELOPMENT PROJECTS

- Add VCFs to an analysis and along with adding new SNPs
- Label and locate SNP positions by reference annotation and kmer sequence
- Label SNPs at nodes
- Give SNPs a quality value
- Speed improvements
- How does the kmer used in the assembly affect the kmer used in kSNP
- Instead of removing conflicts change to IUPAC mixed SNP nomenclature
- Remove homoplastic snps from analysis/tree building
# filter R2 reads from ronnY...R2 based on the R1_pasted reads
cd ../raw

## make a list of fastq header sequences
head -n 5000 R1_pasted_strange_CGATCGTC.fastq | sed -n '1~4p' | cut -c 2- | awk '{print $1}' > R1_pasted_strange_CGATCGTC_ID.lst

head -n 5000 R1_pasted_AGCTAGTC.fastq | sed -n '1~4p' | cut -c 2- | awk '{print $1}' > R1_pasted_AGCTAGTC_ID.lst

head -n 5000 R1_pasted_strange_CGGACTGT.fastq | sed -n '1~4p' | cut -c 2- | awk '{print $1}' > R1_pasted_strange_CGGACTGT_ID.lst
## remove part after space and remove first character

## divide R2 barcodes based on these headers

seqtk subseq ronny_rpi44_S6_R2_001.fastq R1_pasted_strange_CGATCGTC_ID.lst > R1_pasted_strange_CGATCGTC_R2.fastq

seqtk subseq ronny_rpi44_S6_R2_001.fastq R1_pasted_AGCTAGTC_ID.lst > R1_pasted_AGCTAGTC_R2.fastq

seqtk subseq ronny_rpi44_S6_R2_001.fastq R1_pasted_strange_CGGACTGT_ID.lst > R1_pasted_strange_CGGACTGT_R2.fastq 
# grep the R2 reads for barcodes at any position


# keep if barcode found anywhere (check on other are found)

## repeat for strange barcodes, and normal barcodes and look  at the structure of where barcoeds and UMIs are

y
INPUT=data/Ensembl.NCBIM37.67.bed
<$INPUT cat | cut -f1 | sort |uniq -c | awk '{print $2, $1}'
INPUT=/data-shared/fastq/fastq.tar.gz
<$INPUT tar tz | head -5 | xargs tar xvf $INPUT -C data
#filtering the data
<data/HRTMUOC01.RL12.01.fastq paste - - - - | awk '{print $1, length($2)}' | head
<data/HRTMUOC01.RL12.01.fastq paste - - - - | awk '(length($2) > 100)' | tr "\t" "\n" | head

# Function for filtering; use -v to pass arguments to awk to resolve quoting issues
fastq-min-length() { paste - - - - |  awk -v min_len="$1" '(length($2) > min_len)' ;}

# Just to see changes

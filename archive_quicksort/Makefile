all: measurements.csv

quicksort: parallelQuicksort.c
	gcc -pthread -std=c99 -o quicksort parallelQuicksort.c

measurements.txt: quicksort Makefile
	rm -f measurements.txt
	for i in 100 1000 10000 100000 1000000; do       \
	   for rep in `seq 1 5`; do               \
	     echo "Size: $$i" ;                   \
	     ./quicksort $$i ;   \
	   done ;                                 \
	done >> measurements.txt

measurements.csv: measurements.txt
	./csv_quicksort_extractor.pl < $< > $@

archive_quicksort.tgz: parallelQuicksort.c Makefile measurements.txt quicksort.Rmd csv_quicksort_extractor.pl
	tar zcf $@ $^
all: measurements.csv

quicksort: parallelQuicksort.c
	gcc -pthread -std=c99 -o quicksort parallelQuicksort.c

measurements.txt: quicksort Makefile
	rm -f measurements.txt
	for i in 100 1000 10000 100000 200000 300000 400000 500000 600000 700000 800000 900000  1000000 1200000 1400000 1600000 1800000 2000000 2200000 2400000 2600000 2800000; do       \
	   for rep in `seq 1 5`; do               \
	     echo "Size: $$i" ;                   \
	     ./quicksort $$i ;   \
	   done ;                                 \
	done >> measurements.txt

measurements.csv: measurements.txt
	./csv_quicksort_extractor.pl < $< > $@

archive_quicksort.tgz: parallelQuicksort.c Makefile measurements.txt quicksort.Rmd csv_quicksort_extractor.pl
	tar zcf $@ $^


##
## ::: Numbers build file :::
##

.PHONY: clean run

run: numbers
	./$<

numbers: numbers.o
	gcc -o $@ $<

numbers.o: numbers.c
	gcc -c $<

clean:
	rm numbers.o numbers


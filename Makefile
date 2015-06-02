gslx680: driver.o
	gcc -o gslx680 driver.o -lm

driver.o: driver.c driver.h
	gcc -c -o driver.o driver.c

install:
	install gslx680 /bin
	install -d /etc/gslx680
	install touchscreen.fw /etc/gslx680

clean:
	rm -rf gslx680 *.o


CC = g++
CCFLAGS = -Wall

example: diner2.o
	$(CC) $(CCFLAGS) -o diner2 diner2.o -pthread

example.o: diner2.cpp
	$(CC) $(CCFLAGS) -c diner2.cpp -pthread

clean:
	- rm *.o
	- rm diner2
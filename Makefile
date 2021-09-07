DIR := ${CURDIR} 

CC                   = gcc 
CXX                  = g++ 
LINK_OPT             = 
VERSION              = 
OPTIMIZE_FLAGS       = -O3 -finline-functions
CXXFLAGS             = -Wall -std=c++1y -pthread -DNODBG -DNO_CMAKE_CONFIG 
CFLAGS               = $(DIS) 
LDFLAGS              = $(DIS) -L. -pthread 
INCS                 = -I build/libraries/ 	
LIBS                 = -lm -lpthread 
INCLUDES             = -I. $(INCS) 
TARGET               = farm #seq pipeline   
SOURCES		     =  farm_diner.cpp # sequential_diner.cpp diner_pipeline.cpp  
SRC = .
INC = .

.PHONY: all clean cleanall 

all:$(TARGET)

#seq: sequential_diner.cpp 
#	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS) -c -o seq.o sequential_diner.cpp $(LIBS)
#	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS)  -o seq seq.o $(LIBS)

#pipeline:
#	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS) -c -o pipeline.o diner_pipeline.cpp $(LIBS) -lpthread
#	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o pipeline pipeline.o $(LIBS) -lpthread

farm:
	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS) -c -o farm.o farm_diner.cpp $(LIBS) -lpthread
	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o farm farm.o $(LIBS) -lpthread

clean:
	rm -f *.o

cleanall: clean
	rm -fr $(TARGET) *~ *.dSYM

depend:
	makedepend $(SOURCES)

# DO NOT DELETE THIS LINE -- make depend depends on it.

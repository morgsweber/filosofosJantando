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
TARGET               = marius seq pipeline farm   
SOURCES		     = marius_version.cpp sequential_diner.cpp pipeline_diner.cpp farm_diner.cpp  
SRC = .
INC = .

.PHONY: all clean cleanall 

all:$(TARGET)

marius:
	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS) -c -o marius.o marius_version.cpp $(LIBS) -lpthread
	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o marius marius.o $(LIBS) -lpthread

seq: sequential_diner.cpp 
	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS) -c -o seq.o sequential_diner.cpp $(LIBS)
	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS)  -o seq seq.o $(LIBS)

pipeline:
	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS) -c -o pipeline.o pipeline_diner.cpp $(LIBS) -lpthread
	$(CXX)  $(CXXFLAGS) $(OPTIMIZE_FLAGS)  $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o pipeline pipeline.o $(LIBS) -lpthread

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

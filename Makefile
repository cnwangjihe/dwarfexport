

CXX ?= g++
CXXFLAGS=-fPIC -shared -std=c++17 -fpermissive #-Wall -Wextra -m32
#LDFLAGS+=-static-libgcc -static-libstdc++
LIBS=-lida -ldwarf
INCLUDES=-I$(IDASDK_PATH)/include -I$(IDA_PATH)/plugins/hexrays_sdk/include

DWARFEXPORT_SRC = $(wildcard src/*.cpp)

all: bin/dwarfexport.plx bin/dwarfexport.plx64

bin/dwarfexport.plx: $(DWARFEXPORT_SRC)
	$(CXX) $(LDFLAGS) $(DWARFEXPORT_SRC) $(CXXFLAGS) \
	-L. \
	-L$(IDA_PATH) \
	$(INCLUDES) \
	-D__LINUX__ $(LIBS) -o bin/dwarfexport.plx

bin/dwarfexport.plx64: $(DWARFEXPORT_SRC)
	$(CXX) $(LDFLAGS) $(DWARFEXPORT_SRC) $(CXXFLAGS) \
	-L. \
	-L$(IDA_PATH) \
	$(INCLUDES) \
	-D__LINUX__ -D__EA64__ $(LIBS) -o bin/dwarfexport.plx64

clean:
	rm -f bin/dwarfexport.plx bin/dwarfexport.plx64

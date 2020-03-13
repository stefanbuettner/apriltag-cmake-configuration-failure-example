.PHONY: all clean

all: build/compile_commands.json
	cd build &&\
	$(MAKE)

clean:
	rm -fr build

build:
	mkdir build

build/compile_commands.json: build
	cd build &&\
	cmake ..\
		-DCMAKE_EXPORT_COMPILE_COMMANDS=ON\
		-DCMAKE_PREFIX_PATH=/home/sb/code/libapriltag/install

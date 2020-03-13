.PHONY: all clean

all: build/compile_commands.json
	cd build &&\
	$(MAKE)

clean:
	rm -fr build

build:
	mkdir build

build/compile_commands.json: build apriltag/install
	cd build &&\
	cmake ..\
		-DCMAKE_EXPORT_COMPILE_COMMANDS=ON\
		-DCMAKE_PREFIX_PATH=apriltag/install

apriltag:
	git clone https://github.com/AprilRobotics/apriltag.git

apriltag/build: apriltag
	cd apriltag &&\
	mkdir -p build &&\
	cd build &&\
	cmake -DCMAKE_INSTALL_PREFIX=../install ..

apriltag/install: apriltag/build
	cd apriltag/build &&\
	make install


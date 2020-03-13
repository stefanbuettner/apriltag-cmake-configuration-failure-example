cmake_minimum_required(VERSION 3.10.2)

project(apriltag-test)

find_package(apriltag REQUIRED)

# This should not be required. Uncommenting this fixes the configuration failure.
#find_package(Threads REQUIRED)

add_library(apriltag-test
    apriltag-test.cpp)

target_link_libraries(apriltag-test
    PRIVATE
        apriltag
)

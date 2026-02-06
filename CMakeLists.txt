cmake_minimum_required(VERSION 3.20)

project(cppplayground)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release)
endif()

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(httplib CONFIG REQUIRED)
find_package(spdlog CONFIG REQUIRED)

add_executable(cppplayground main.cpp)

target_link_libraries(cppplayground PRIVATE httplib::httplib spdlog::spdlog)
target_compile_options(cppplayground PRIVATE -Wall -Wextra -Wpedantic)

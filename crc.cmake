# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.14)
include(FetchContent)
FetchContent_Declare(
    lammertb_libcrc_src
    URL https://github.com/lammertb/libcrc/archive/refs/tags/v2.0.zip
)
FetchContent_MakeAvailable(lammertb_libcrc_src)
add_custom_target(
    lammertb_libcrc_build
    WORKING_DIRECTORY ${lammertb_libcrc_src_SOURCE_DIR}
    COMMAND make lib/libcrc.a
)

add_library(
    lammertb_libcrc
    STATIC IMPORTED
)
set_target_properties(
    lammertb_libcrc PROPERTIES
    IMPORTED_LOCATION "${lammertb_libcrc_src_SOURCE_DIR}/lib/libcrc.a"
    INTERFACE_INCLUDE_DIRECTORIES "${lammertb_libcrc_src_SOURCE_DIR}/include"
)

add_library(
    crc
    INTERFACE
)
target_include_directories(
    crc
    INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/include"
)
add_dependencies(
    crc
    lammertb_libcrc_build
)
target_link_libraries(
    crc
    INTERFACE lammertb_libcrc
)
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.14)
project(crc)
enable_testing()

include(crc.cmake)
include(gtest.cmake)

add_subdirectory(test)

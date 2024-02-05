# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.14)
add_executable(
    crc_test
    crc_test.cpp
)
target_link_libraries(
    crc_test
    crc
    GTest::gtest_main
)
include(GoogleTest)
gtest_discover_tests(crc_test)
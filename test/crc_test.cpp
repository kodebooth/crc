// SPDX-License-Identifier: MIT

#include <gtest/gtest.h>

#include "kodebooth/crc/crc.h"

static const unsigned char test[] = "123456789";
static const unsigned int length = sizeof(test) - sizeof('\0');

TEST(CRCTest, CRC16) {
    EXPECT_EQ(kodebooth::crc::crc_16(test, length), 0xBB3D);
}
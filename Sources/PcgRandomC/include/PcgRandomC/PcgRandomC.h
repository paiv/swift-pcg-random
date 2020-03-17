#pragma once
#include <stdint.h>

typedef __uint128_t uint128_t;


typedef union {
    uint128_t value;
    struct {
        uint64_t lo;
        uint64_t hi;
    };
} UInt128;


inline __attribute__((always_inline))
UInt128
uint128_add(UInt128 a, UInt128 b) {
    UInt128 r = { a.value + b.value };
    return r;
}


inline __attribute__((always_inline))
UInt128
uint128_mul(UInt128 a, UInt128 b) {
    UInt128 r = { a.value * b.value };
    return r;
}


inline __attribute__((always_inline))
UInt128
uint128_or(UInt128 a, uint32_t b) {
    UInt128 r = { a.value | b };
    return r;
}


inline __attribute__((always_inline))
UInt128
uint128_shl(UInt128 a, uint32_t b) {
    UInt128 r = { a.value << b };
    return r;
}


inline __attribute__((always_inline))
UInt128
uint128_shr(UInt128 a, uint32_t b) {
    UInt128 r = { a.value >> b };
    return r;
}

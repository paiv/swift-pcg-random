#pragma once
#include <stdbool.h>
#include <stdint.h>

#ifdef __LP64__

typedef union {
    __uint128_t value;
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
uint128_neg(UInt128 a) {
    UInt128 r = { -a.value };
    return r;
}


inline __attribute__((always_inline))
UInt128
uint128_add32(UInt128 a, uint32_t b) {
    UInt128 r = { a.value + b };
    return r;
}


inline __attribute__((always_inline))
UInt128
uint128_mul(UInt128 a, UInt128 b) {
    UInt128 r = { a.value * b.value };
    return r;
}


inline __attribute__((always_inline))
uint32_t
uint128_and32(UInt128 a, uint32_t b) {
    return a.value & b;
}


inline __attribute__((always_inline))
UInt128
uint128_or32(UInt128 a, uint32_t b) {
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


inline __attribute__((always_inline))
bool
uint128_lt(UInt128 a, UInt128 b) {
    return a.value < b.value;
}

#endif

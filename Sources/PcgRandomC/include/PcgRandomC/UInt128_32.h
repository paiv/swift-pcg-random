#pragma once
#include <stdbool.h>
#include <stdint.h>

#ifndef __LP64__

typedef struct {
    uint64_t lo;
    uint64_t hi;
} UInt128;


UInt128
uint128_add(UInt128 a, UInt128 b) {
    uint64_t lo, hi, ci, co;
    
    lo = __builtin_addcll(a.lo, b.lo, 0, &ci);
    hi = __builtin_addcll(a.hi, b.hi, ci, &co);
    
    UInt128 r = { lo, hi };
    return r;
}


UInt128
uint128_neg(UInt128 a) {
    uint64_t lo, hi, ci, co;
    
    lo = __builtin_addcll(~a.lo, 1, 0, &ci);
    hi = __builtin_addcll(~a.hi, 0, ci, &co);
    
    UInt128 r = { lo, hi };
    return r;
}


UInt128
uint128_add32(UInt128 a, uint32_t b) {
    uint64_t lo, hi, ci, co;
    
    lo = __builtin_addcll(a.lo, b, 0, &ci);
    hi = __builtin_addcll(a.hi, 0, ci, &co);
    
    UInt128 r = { lo, hi };
    return r;
}


UInt128
uint128_mul(UInt128 a, UInt128 b) {
    uint64_t aw[4] = { (a.lo & 0xffffffff), (a.lo >> 32), (a.hi & 0xffffffff), (a.hi >> 32) },
             bw[4] = { (b.lo & 0xffffffff), (b.lo >> 32), (b.hi & 0xffffffff), (b.hi >> 32) },
             lo, hi, ci, co;
    
    lo = aw[0] * bw[0];
    lo = __builtin_addcll(lo, aw[0] * bw[1], 0, &ci);
    lo = __builtin_addcll(lo, aw[1] * bw[0], ci, &co);
    
    hi = aw[0] * bw[2];
    hi = __builtin_addcll(hi, aw[0] * bw[3], co, &ci);
    hi = __builtin_addcll(hi, aw[1] * bw[1], ci, &co);
    hi = __builtin_addcll(hi, aw[1] * bw[2], co, &ci);
    hi = __builtin_addcll(hi, aw[2] * bw[0], ci, &co);
    hi = __builtin_addcll(hi, aw[2] * bw[1], co, &ci);
    hi = __builtin_addcll(hi, aw[3] * bw[0], ci, &co);
    
    UInt128 r = { lo, hi };
    return r;
}


uint32_t
uint128_and32(UInt128 a, uint32_t b) {
    uint32_t r = a.lo & b;
    return r;
}


UInt128
uint128_or32(UInt128 a, uint32_t b) {
    UInt128 r = { a.lo | b, a.hi };
    return r;
}


UInt128
uint128_shl(UInt128 a, uint32_t b) {
    uint64_t lo = 0, hi = 0, c = 0;
    
    if (b < 128) {
        if (b < 64) {
            lo = a.lo << b;
            c = a.lo >> (64 - b);
            hi = a.hi << b;
        } else {
            hi = a.lo << (b - 64);
        }
    }
    
    UInt128 r = { lo, hi | c };
    return r;
}


UInt128
uint128_shr(UInt128 a, uint32_t b) {
    uint64_t lo = 0, hi = 0, c = 0;
    
    if (b < 128) {
        if (b < 64) {
            lo = a.lo >> b;
            c = a.hi << (64 - b);
            hi = a.hi >> b;
        } else {
            lo = a.hi >> (b - 64);
        }
    }
    
    UInt128 r = { lo | c, hi };
    return r;
}


bool
uint128_lt(UInt128 a, UInt128 b) {
    return a.hi == b.hi
        ? a.lo < b.lo
        : a.hi < b.hi;
}

#endif

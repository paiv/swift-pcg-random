#if SWIFT_PACKAGE
import PcgRandomC
typealias UInt128 = PcgRandomC.UInt128
#endif


extension UInt128 {

    init(lo: UInt64, hi: UInt64) {
        self.init()
        self.lo = lo
        self.hi = hi
    }

    init(_ lo: UInt64) {
        self.init(lo: lo, hi: 0)
    }

    static func &+ (lhs: Self, rhs: Self) -> Self {
        return uint128_add(lhs, rhs)
    }

    static func &+= (lhs: inout Self, rhs: Self) {
        lhs = uint128_add(lhs, rhs)
    }

    static func &* (lhs: Self, rhs: Self) -> Self {
        return uint128_mul(lhs, rhs)
    }

    static func | (lhs: Self, rhs: UInt32) -> Self {
        return uint128_or(lhs, rhs)
    }

    static func << (lhs: Self, rhs: UInt32) -> Self {
        return uint128_shl(lhs, rhs)
    }

    static func >> (lhs: Self, rhs: UInt32) -> Self {
        return uint128_shr(lhs, rhs)
    }
}

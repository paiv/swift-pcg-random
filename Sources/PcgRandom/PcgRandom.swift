import Synchronization


public final class Pcg64Random : RandomNumberGenerator, Sendable {
    // pcg64 = pcg_engines::setseq_xsl_rr_128_64

    public init(seed: UInt128, increment: UInt128) {
        self.state = Mutex(Self.bump(state: increment &+ seed, increment: increment))
        self.increment = increment
    }

    private let state: Mutex<UInt128>
    private let increment: UInt128

    private static let multiplier = UInt128(0x2360ed051fc65da44385df649fccf645)
    private static let defaultIncrement = UInt128(0x5851f42d4c957f2d14057b7ef767814f)

    public func next() -> UInt64 {
        state.withLock { store in
            let state = Self.bump(state: store, increment: increment)

            let rot = UInt32(truncatingIfNeeded: state >> 122)
            let xored = UInt64(truncatingIfNeeded: (state >> 64) ^ state)
            let result = (xored >> rot) | (xored << ((0 &- rot) & 63))

            store = state
            return result
        }
    }

    @inline(__always)
    private static func bump(state: UInt128, increment: UInt128) -> UInt128 {
        return state &* Self.multiplier &+ increment
    }

    public func advance(by delta: UInt128) {
        var delta = delta
        var cur_mult = Self.multiplier
        var cur_plus = increment
        var acc_mult = UInt128(1)
        var acc_plus = UInt128(0)
        while (delta > 0) {
           if (delta & 1 != 0) {
              acc_mult &*= cur_mult
              acc_plus = acc_plus &* cur_mult &+ cur_plus
           }
           cur_plus = (cur_mult &+ 1) &* cur_plus
           cur_mult &*= cur_mult
           delta >>= 1;
        }

        state.withLock { store in
            store = acc_mult &* store &+ acc_plus
        }
    }
}


public extension Pcg64Random {

    convenience init(seed: UInt128, stream: UInt128) {
        self.init(seed: seed, increment: ((stream << 1) | 1))
    }

    convenience init(seed: UInt128) {
        self.init(seed: seed, increment: Self.defaultIncrement)
    }

    func discard(_ delta: UInt128) {
        advance(by: delta)
    }

    func backstep(by delta: UInt128) {
        advance(by: 0 &- delta)
    }
}


public extension Pcg64Random {

    convenience init(seed: Int) {
        self.init(seed: UInt128(truncatingIfNeeded: seed))
    }

    convenience init(seed: Int, stream: Int) {
        self.init(seed: UInt128(truncatingIfNeeded: seed), stream: UInt128(truncatingIfNeeded: stream))
    }

    func advance(by delta: Int) {
        advance(by: UInt128(truncatingIfNeeded: delta))
    }

    func discard(_ delta: Int) {
        discard(UInt128(truncatingIfNeeded: delta))
    }

    func backstep(by delta: Int) {
        backstep(by: UInt128(truncatingIfNeeded: delta))
    }
}

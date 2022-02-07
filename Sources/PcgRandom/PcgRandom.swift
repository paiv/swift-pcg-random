
public class Pcg64Random : RandomNumberGenerator {
    // pcg64 = pcg_engines::setseq_xsl_rr_128_64

    public init(seed: UInt128, increment: UInt128, lock: PcgRandomLocking) {
        self.lock = lock
        self.state = Self.bump(state: increment &+ seed, increment: increment)
        self.increment = increment
    }

    private var state: UInt128
    private let increment: UInt128
    private var lock: PcgRandomLocking

    private static let multiplier = UInt128(lo: 4865540595714422341, hi: 2549297995355413924)
    private static let defaultIncrement = UInt128(lo: 1442695040888963407, hi: 6364136223846793005)

    public func next() -> UInt64 {
        lock.lock()
        defer { lock.unlock() }

        let state = Self.bump(state: self.state, increment: increment)

        let rot = UInt32(truncatingIfNeeded: (state >> 122).lo)
        let xored = state.hi ^ state.lo
        let result = (xored >> rot) | (xored << ((-Int32(truncatingIfNeeded: rot)) & 63))

        self.state = state
        return result
    }

    @inline(__always)
    private static func bump(state: UInt128, increment: UInt128) -> UInt128 {
        return state &* Self.multiplier &+ increment
    }

    class func defaultLock() -> PcgRandomLocking {
        #if os(Linux)
            return PThreadMutex()
        #else

        if #available(macOS 10.12, iOS 10.0, watchOS 3.0, *) {
            return OSUnfairLock()
        }
        else {
            return PThreadMutex()
        }

        #endif
    }

    public func advance(by delta: UInt128) {
        lock.lock()
        defer { lock.unlock() }

        var delta = delta
        let zero = UInt128(0)
        let one = UInt32(1)
        var cur_mult = Self.multiplier
        var cur_plus = increment
        var acc_mult = UInt128(1)
        var acc_plus = UInt128(0)
        while (zero < delta) {
           if (delta & one != 0) {
              acc_mult &*= cur_mult
              acc_plus = acc_plus &* cur_mult &+ cur_plus
           }
           cur_plus = (cur_mult &+ one) &* cur_plus
           cur_mult &*= cur_mult
           delta >>= 1;
        }
        state = acc_mult &* state &+ acc_plus
    }
}


public extension Pcg64Random {

    convenience init(seed: UInt128, stream: UInt128, lock: PcgRandomLocking) {
        self.init(seed: seed, increment: ((stream << 1) | 1), lock: lock)
    }

    convenience init(seed: UInt128, lock: PcgRandomLocking) {
        self.init(seed: seed, increment: Self.defaultIncrement, lock: lock)
    }

    convenience init(seed: UInt128, stream: UInt128) {
        self.init(seed: seed, stream: stream, lock: Self.defaultLock())
    }

    convenience init(seed: UInt128) {
        self.init(seed: seed, lock: Self.defaultLock())
    }

    func discard(_ delta: UInt128) {
        advance(by: delta)
    }

    func backstep(by delta: UInt128) {
        advance(by: -delta)
    }
}


public extension Pcg64Random {

    convenience init(seed: UInt64, lock: PcgRandomLocking) {
        self.init(seed: UInt128(seed), lock: lock)
    }

    convenience init(seed: UInt64, stream: UInt64) {
        self.init(seed: UInt128(seed), stream: UInt128(stream))
    }

    convenience init(seed: UInt64) {
        self.init(seed: UInt128(seed))
    }

    func advance(by delta: UInt64) {
        advance(by: UInt128(delta))
    }

    func discard(_ delta: UInt64) {
        discard(UInt128(delta))
    }

    func backstep(by delta: UInt64) {
        backstep(by: UInt128(delta))
    }
}

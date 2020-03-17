
public class Pcg64Random : RandomNumberGenerator {
    // pcg64 = pcg_engines::setseq_xsl_rr_128_64

    public init(seed: UInt64, lock: PcgRandomLocking) {
        self.lock = lock
        self.state = Self.bump(state: Self.defaultIncrement &+ UInt128(seed), increment: Self.defaultIncrement)
        self.increment = Self.defaultIncrement
    }

    public convenience init(seed: UInt64) {
        self.init(seed: seed, lock: Self.defaultLock())
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
        if #available(macOS 10.12, iOS 10.0, *) {
            return OSUnfairLock()
        }
        else {
            return PThreadMutex()
        }
    }
}

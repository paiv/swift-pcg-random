import PcgRandomC


public class Pcg64Random : RandomNumberGenerator {
    // pcg64 = pcg_engines::setseq_xsl_rr_128_64

    init(seed: UInt64, lock: PcgRandomLocking) {
        state = pcg_random(seed)
        self.lock = lock
    }

    convenience init(seed: UInt64) {
        self.init(seed: seed, lock: Self.defaultLock())
    }

    deinit {
        pcg_random_free(state)
    }

    private let state: OpaquePointer?
    private var lock: PcgRandomLocking

    public func next() -> UInt64 {
        lock.lock()
        defer { lock.unlock() }
        return pcg_random_next(state)
    }
}


private extension Pcg64Random {

    static func defaultLock() -> PcgRandomLocking {
        if #available(macOS 10.12, iOS 10.0, *) {
            return OSUnfairLock()
        }
        else {
            return PThreadMutex()
        }
    }
}

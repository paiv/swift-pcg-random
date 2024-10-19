#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS) || os(visionOS)
import os

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
struct OSUnfairLock : PcgRandomLocking {

    private var vault = os_unfair_lock()

    mutating func lock() {
        os_unfair_lock_lock(&vault)
    }

    mutating func unlock() {
        os_unfair_lock_unlock(&vault)
    }
}

#endif

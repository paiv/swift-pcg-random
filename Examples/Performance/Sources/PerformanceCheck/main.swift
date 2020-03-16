// swift run -c release
import Dispatch
import PcgRandom


func measure(_ sampleCount: Int = 100, _ block: () -> Void) -> Double {
    var samples: [UInt64] = []

    for _ in 0..<sampleCount {
        let start = DispatchTime.now().uptimeNanoseconds
        block()
        let end = DispatchTime.now().uptimeNanoseconds
        let sample = (end - start)
        samples.append(sample)
    }

    return Double(samples.reduce(0, +)) / Double(sampleCount) / 1e9
}


struct NoLock : PcgRandomLocking {
    mutating func lock() {}
    mutating func unlock() {}
}


func main() {
    let mean = measure {
        let pcg = Pcg64Random(seed: 1111, lock: NoLock())
        for _ in (0..<1_000_000) {
            _ = pcg.next()
        }
    }

    print(mean)
}


main()

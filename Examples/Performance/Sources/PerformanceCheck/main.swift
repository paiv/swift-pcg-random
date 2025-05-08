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

    samples.sort()
    let median = samples[sampleCount / 2]
    return Double(median) / 1e9
}


func main() {
    let pcg = Pcg64Random(seed: 1111)

    let seconds = measure {
        for _ in (0..<1_000_000) {
            _ = pcg.next()
        }
    }

    print(seconds)
}


main()

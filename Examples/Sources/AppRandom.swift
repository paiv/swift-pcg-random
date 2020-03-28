import PcgRandom


class Random  {
    static let shared = Random()

    private var random = Pcg64Random(seed: .random(in: .min ... .max))
}


extension Random {
    
    func reset(seed: UInt64) {
        random = Pcg64Random(seed: seed)
    }
    
    func reset(seed: String) {
        var hash: UInt32 = 0
        
        for x in seed.unicodeScalars {
            var k = x.value
            k &*= 0xcc9e2d51
            k = (k << 15) | (k >> 17)
            k &*= 0x1b873593

            hash ^= k
            hash = (hash << 13) | (hash >> 19)
            hash = hash &* 5 &+ 0xe6546b64
        }
        
        reset(seed: UInt64(hash))
    }
    
    func bool() -> Bool {
        return Bool.random(using: &random)
    }
    
    func integer<I>(in range: Range<I>) -> I where I:FixedWidthInteger {
        return I.random(in: range, using: &random)
    }
    
    func integer<I>(in range: ClosedRange<I> = .min ... .max) -> I where I:FixedWidthInteger {
        return I.random(in: range, using: &random)
    }

    func float(in range: Range<Float>) -> Float {
        return Float.random(in: range, using: &random)
    }

    func float(in range: ClosedRange<Float> = 0...1) -> Float {
        return Float.random(in: range, using: &random)
    }

    static let abc = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    
    func string(charCount: Int) -> String {
        return String((0..<charCount).compactMap { _ in Self.abc.randomElement(using: &random) })
    }
}

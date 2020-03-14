PCG Random Number Generator
==

[![](https://github.com/paiv/swift-pcg-random/workflows/Build/badge.svg)](https://github.com/paiv/swift-pcg-random/actions)

[PCG random][HOME] generator for Swift language.

[HOME]: https://www.pcg-random.org/


Installation
--

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/paiv/swift-pcg-random.git", .upToNextMajor(from: "1.0.0"))
]
```


Usage
--

```swift
import PcgRandom
var pcg = Pcg64Random(seed: .random(in: 0...(.max)))
let dice = Int.random(in: 1...20, using: &pcg)
print(dice)
```

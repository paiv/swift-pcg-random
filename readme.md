PCG Pseudorandom Number Generator
==

[![standwithukraine](https://user-images.githubusercontent.com/196601/157238669-803a0bd3-4039-486e-a177-6e12f387867e.svg)](https://ukrainewar.carrd.co/) [![](https://github.com/paiv/swift-pcg-random/workflows/Build/badge.svg)](https://github.com/paiv/swift-pcg-random/actions)
[![cocoapods](https://img.shields.io/cocoapods/v/PcgRandom.svg)](https://cocoapods.org/pods/PcgRandom)


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

### CocoaPods

```ruby
pod 'PcgRandom', '~> 1.0'
```


Usage
--

```swift
import PcgRandom
var pcg = Pcg64Random(seed: 42)
let dice = Int.random(in: 1...20, using: &pcg)
print(dice)
```

import XCTest
@testable import PcgRandom


class Pcg64RandomTests : XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func test_canon_seed_0_default_stream() {
        // pcg64 rng(0u); rng();
        let canon: [UInt64] = [
            0x01070196e695f8f1, 0x703ec840c59f4493, 0xe54954914b3a44fa, 0x96130ff204b9285e,
            0x7d9fdef535ceb21a, 0x666feed42e1219a0, 0x981f685721c8326f, 0xad80710d6eab4dda,
            0xe202c480b037a029, 0x5d3390eaedd907e2, 0x0756befb39c6b8aa, 0x1fb44ba6634d62a3,
            0x8d20423662426642, 0x34ea910167a39fb4, 0x93010b43a80d0ab6, 0x663db08a98fc568a,
            0x720b0a1335956fae, 0x2c35483e31e1d3ba, 0x429f39776337409d, 0xb46d99e638687344,
            0x105370b96aedcaee, 0x3999e92f811cff71, 0xd230f8bcb591cfc9, 0x0dce3db2ba7bdea5,
            0xcf2f52c91eec99af, 0x2bc7c24a8b998a39, 0xbd8af1b0d599a19c, 0x56bc45abc66059f5,
            0x170a46dc170f7f1e, 0xc25daf5277b85fad, 0xe629c2e0c948eadb, 0x1720a796915542ed,
            0x22fb0caa4f909951, 0x7e0c0f4175acd83d, 0xd9fcab37ff2a860c, 0xab2280fb2054bad1,
            0x58e8a06f37fa9e99, 0xc3a52a30b06528c7, 0x0175f773a13fc1bd, 0x731cfc584b00e840,
            0x404cc7b2648069cb, 0x5bc29153b0b7f783, 0x771310a38cc999d1, 0x766a572f0a71a916,
            0x90f450fb4fc48348, 0xf080ea3e1c7b1a0d, 0x15471a4507d66a44, 0x7d58e55a78f3df69,
            0x0130a094576ac99c, 0x46669cb2d04b1d87, 0x17ab5bed20191840, 0x95b177d260adff3e,
            0x025fb624b6ee4c07, 0xb35de4330154a95f, 0xe8510fff67e24c79, 0x132c3cbcd76ed2d3,
            0x35e7cc145a093904, 0x9f5b5b5f81583b79, 0x3ee749a533966233, 0x4af85886cdeda8cd,
            0x0ca5380ecb3ef3aa, 0x4f674eb7661d3192, 0x88a29aad00cd7733, 0x70b627ca045ffac6,
            0x5912b43ea887623d, 0x95dc9fc6f62cf221, 0x926081a12a5c905b, 0x9c57d4cd7dfce651,
            0x85ab2cbf23e3bb5d, 0xc5cd669f63023152, 0x3067be0fad5d898e, 0x12b56f444cb53d05,
            0xbc2e5a640c3434fc, 0x9280bff0e4613fe1, 0x98819094c528743e, 0x999d1c98d829df33,
            0x9ff82a012dc89242, 0xf99183ed39c8be94, 0xf0f59161cd421c55, 0x3c705730c2f6c48d,
        ]
        let random = Pcg64Random(seed: 0)
        for expected in canon {
            let actual = random.next()
            XCTAssertEqual(actual, expected);
        }
    }

    func test_canon_seed_42_default_stream() {
        // pcg64 rng(42u); rng();
        let canon: [UInt64] = [
            0x287472e87ff5705a, 0xbbd190b04ed0b545, 0xb6cee3580db14880, 0xbf5f7d7e4c3d1864,
            0x734eedbe7e50bbc5, 0xa5b6b5f867691c77, 0x6d6d2656235610ad, 0x8a162806f2198c2b,
            0xf081ea24deb2b30a, 0x21b5ea8a65340741, 0x0518c82bf0d466d3, 0x8f0b503c497c0f05,
            0x1171003f92002f30, 0x6adc3f42251e86a6, 0x816da11971f22fb7, 0x061459ba9fbe3382,
            0xb6499a3b72195b21, 0x688e00d9a1b3a685, 0xca8e23431eda68fe, 0x94621374976ef870,
            0xf6869a3b7aa2ef3c, 0x1f6b77cd26fac265, 0x5fb030291cee0689, 0x809e5fa82e578f73,
            0x20a0feb2a94e43be, 0xe6bde0b3e0bce4df, 0xf647053df935c1f9, 0x80729115013a39b3,
            0x3c6db4db76afe5b2, 0xd85f5da2cde1354e, 0x9e68beb23cf945a2, 0xd290472b367d81a0,
            0x177ead229753a610, 0x13e76abaa42294d1, 0x8aa47215b93d72ad, 0x0636bc518669bd30,
            0x9e8834ed1b7b9d0d, 0xb32a95c422d3d4be, 0x65d7c6276f205618, 0xb3d8843b8f723baa,
            0x7b0f5c81c8f056d6, 0x1b5fd9a41ea6a615, 0x081674d49d774fb5, 0x04abb071747046c2,
            0x43809619495a2c07, 0xe95e95f941fdba7b, 0x3f67e6b4f0c14f26, 0xac268637768a93de,
            0x2c72543cdf1af3b4, 0x480b8735f3864910, 0xe8093cc44bc48ce0, 0x73c6fbf906ff5ef2,
            0x54e92125797b223d, 0xcf664d4d8fdf29d5, 0x5f83a1fe8b64d45a, 0x5f2cd432b58b5aa5,
            0xfae65bfdcdc189be, 0x0922502a44d20e8d, 0xc0f508dcf1bf0aca, 0xc1764be56983b548,
            0x3399ad3448f411aa, 0xd0cc0b8418861780, 0x1d632d9e9df15810, 0x51dc1486f8ef21f3,
            0x5eb4320e5dcf2368, 0xb206dc02fc99c85d, 0xa569c2d5eecca2df, 0x681d37fc3699fe3c,
            0xc19daea2c5d817a4, 0x55ee92143ef5b901, 0x85068c55eff8afaa, 0x07c939dc69585b3e,
            0x07d456c814d2f12d, 0x43c5388f1d0c8a3b, 0x18717343de9af77a, 0x6eaaf337b0b734ff,
            0xc435d67c48f0f605, 0xfd54bc48b55b38d9, 0x0b58598d50054b40, 0x7cbb113f0aafe8fa,
        ]
        let random = Pcg64Random(seed: 42)
        for expected in canon {
            let actual = random.next()
            XCTAssertEqual(actual, expected);
        }
    }

    func test_multi_threading() {
        let seed = UInt64.random(in: 0..<UInt64.max)
        let sampleCount = 100000

        let expected: Set<UInt64>
        do {
            let randomExpected = Pcg64Random(seed: seed)
            expected = Set((0..<sampleCount).map { _ in randomExpected.next() })
        }

        let random = Pcg64Random(seed: seed)
        var results = Set<UInt64>()
        let resultQueue = DispatchQueue(label: "callback")

        let threading = expectation(description: "threading")
        threading.expectedFulfillmentCount = sampleCount

        DispatchQueue.concurrentPerform(iterations: sampleCount) { _ in
            let value = random.next()
            resultQueue.sync { () -> Void in
                results.insert(value)
            }
            threading.fulfill()
        }

        waitForExpectations(timeout: 10)

        XCTAssertTrue(results == expected, "seed: \(seed), samples: \(sampleCount)")
    }
}

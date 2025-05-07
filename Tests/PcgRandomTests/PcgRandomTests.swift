import Testing
@testable import PcgRandom


struct Pcg64RandomTests {

    @Test func canon_seed_0_default_stream() throws {
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
            try #require(actual == expected)
        }
    }

    @Test func canon_seed_42_default_stream() throws {
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
            try #require(actual == expected)
        }
    }

    @Test func canon_seed_neg1_default_stream() throws {
        // pcg64 rng(-1); rng();
        let canon: [UInt64] = [
            0xe871dc267b3faa96,  0x1acea8566524c7ec,  0x5072f93d3c41ef10,  0xe5d848fd7fd79518,
            0xcdca92aba651fbfa,  0x5b2c8427c7047050,  0x43a64dddc8d350aa,  0x354ec04d5983ccea,
            0x720dab17b0abbabc,  0x1118672cc56d2a71,  0x2774d332a9f8a372,  0x6c4151ee7e6fe6f9,
            0x1d4b411eac2d7582,  0xe64ded6f4e1b669a,  0x957ceea5e5537363,  0xa178a8409ee1a291,
            0x061bc8922953d949,  0x6a4fd78a8568ff2d,  0x1bb539563cb38658,  0x08db84b00d68dff1,
            0x80887c5ec2105be6,  0x3848d8708ef1579f,  0x03afe4c2d0dd844a,  0x327c5ffb9fbf9917,
            0x7aa3f35bebf41f58,  0x9aac87c50caa18f6,  0xcdf82eecd984e507,  0x7f03afe28923f0a8,
            0x0e38ddfd4b374e56,  0xfa2bcb04c5ddb6ac,  0xe214cb37795f62bc,  0x0853223cdbaa2c72,
            0x5cd3f5d86b82c8de,  0x5b80fc30c8e17b7a,  0x28e600f90700c685,  0xc60cd5ce983f803b,
            0xd2c08377f6f99c79,  0x8bfeddb9dcfab5a3,  0xf22c369cc3bb916e,  0x315e626283cc3824,
            0x53df7a9806646092,  0xcd4d96d79c1aa5dc,  0x8ba8c787c5ffcf15,  0xc2e83bea956cd175,
            0x0067485c4ffefacd,  0x27148c74c5f1c598,  0x8d1b50ae5beb7334,  0x59298c390fa58da8,
            0x2ee0934f848fc842,  0xc3d18e01104aed2b,  0x5d4a3beea7ffc5fd,  0x51c6843f404b9443,
            0xd8b55bcd8f4af3df,  0xad28312b6b5e5209,  0xa392ff2a07145bce,  0xdc8c17101b00a9ff,
            0x8fd44a46e05ff310,  0xd14936af2cc10953,  0x381853ebbc5d2263,  0x76f4ebfd1244f901,
            0x80df95a9278dc4f0,  0x9f6b36963a7e7d9d,  0x37a34f6b2db1be14,  0xd8ddcacd8f8b57ed,
            0xcf27a5f888c1f7d4,  0x32ca0f13d2c82aef,  0x99d88c21a5f0284b,  0x5c741738ad23485e,
            0x6893127cfd5f717c,  0x057b6cdfafbd47f5,  0x83245945a5b1a5ee,  0x91a50d4728785aaf,
            0x3fc81153388eda6e,  0x2826b316f20a8763,  0x2656d8f7442c8c7b,  0x8a6f8ab258f96087,
            0xadc1594dc5a8b389,  0x048115c47d4ea7bc,  0xab30064b316b0e43,  0xaff92e97ffbe7fe2,
        ]
        let random = Pcg64Random(seed: -1)
        for expected in canon {
            let actual = random.next()
            try #require(actual == expected)
        }
    }

    @Test func canon_seed_314_default_stream_advance() throws {
        // pcg64 rng(314); rng.advance(6283185307179586476); rng();
        let canon: [UInt64] = [
            0x3f7259fbf9f1eaf3, 0xc7b521fb7edc4f5f, 0xf5b9638b9e5f4eb3, 0x24d0329752253947,
            0x07996735a9ff811b, 0x3b54ad86898031d4, 0xf24650a1e5555fa2, 0xc1ff8e07a7d12a5c,
            0xdd71cf414a50687a, 0x5424ada25b5491cd, 0xfc12c1a267bfd0d0, 0x57054254321ee1dc,
            0x54a46561a91a99f8, 0xff02e579bbf732b9, 0xe2792a45e88c5a24, 0xdf2cccc73cad9f22,
            0x3dbfb7764107fbee, 0xf40a25e2e7648126, 0x031078945a6c6276, 0xbf9320fc7471cde7,
            0x78851cc02d653b1d, 0xf58405828ea6eeaf, 0xdbd8d5df9721181d, 0x836e0407d3c7e9eb,
            0x6f200d61ec06f5dc, 0x76628362d9aedbec, 0x70855de43299b85f, 0x0b46618e75e3be50,
            0x5a4a3bb546b54f10, 0x0d55fdb1bf30922b, 0x4d60b190fc29e1f4, 0x02b7ced2bc217037,
            0x8134d17e72f57978, 0x5b0fcad87278e4d7, 0xa1bc57a5a13abf4b, 0x848df703a741b004,
            0xd7aac6cafa645696, 0xd2e4e2b936381762, 0x6a82c9eb01f96849, 0xf5fcbd919a348764,
            0x9c7fb51bc5dafd89, 0x6842f85dfab51b4e, 0xd9f464fa02fcfb6f, 0xd13932dd06256e6b,
            0xdacfd3abcd20ab24, 0xe88c51e69692bc15, 0xab6925dca12c4cb2, 0x9fbd60ba2e5fdfc7,
            0xb0913b042768d1cb, 0x589b1293fe6e1698, 0x98f345e95c3d020a, 0x64ab4f0f43d1d0ce,
            0xd69be064a4b16a67, 0x79527fdb67792e22, 0x563a94efcc20f066, 0x0429f92b7c86ba57,
            0x8728d6be4e95a223, 0xc172e7d50870eb48, 0x154f838ab906b8ed, 0x4b6efbf6a4817324,
            0xad8e7f8c2285f82d, 0x26d66aafaf734af3, 0x35478a3096f696ed, 0xf63a11cfc40c7783,
            0xa3127e67ef240a34, 0x5433b644f5429277, 0xc9e3de22d2cbd929, 0xf2b46093ac3e152c,
            0x58d161157ecf942f, 0x17b361a97693615d, 0xbe2df3a0295c8894, 0x85c46aed5f7a5ec3,
            0x74fb5c77493c69e4, 0x07080b7e206a49d1, 0x9619876eb77f046e, 0x4e7efcd5fce7effe,
            0xd177daa200b374cf, 0x5b7fb89c3bf9d68e, 0x5a2b7968438efd84, 0xc5331abee7de52a1,
        ]
        let random = Pcg64Random(seed: 314)
        random.advance(by: 6283185307179586476)
        for expected in canon {
            let actual = random.next()
            try #require(actual == expected)
        }
    }

    @Test func canon_seed_0_stream_0() throws {
        // pcg64 rng(0, 0); rng();
        let canon: [UInt64] = [
            0xd4feb4e5a4bcfe09, 0xe85a7fe071b026e6, 0x3a5b9037fe928c11, 0x7b044380d100f216,
            0x1c7850a6b6d83e6a, 0x240b82fcc04f0926, 0x7e43df85bf9fba26, 0x43adf3380b1fe129,
            0x03f0fb307287219c, 0x0781f4b84f42a2df, 0x36dac886f4232c6f, 0x0a32006a96a8d46b,
            0xa56e609a788ce098, 0x75711678fa371144, 0xbcdd4619fa063896, 0x5cb5c9a1594f1a04,
            0x799e6cc7d09bf3fd, 0xda1a4b52f72a8c6f, 0x374b6f698c864e48, 0x96a3e4d45b8d252d,
            0x5fc89e7cbf7735e4, 0xe0cfe37beef7efe6, 0xc3467c95f4649808, 0x95cbda6a3275f18a,
            0x3a4dc1e59bdb4172, 0x47f8755023ac78b5, 0xef8e166bf07dfa95, 0x40065cf0fa99882d,
            0xbaa083ad70102eb6, 0x07c88e9d1a72a8dc, 0x1484e44aa83e901e, 0xf0f8df78086fdeba,
            0x5114e38e0cff505d, 0x7e04bb9a2828c944, 0xb88c0de9e2af5658, 0xecba992ca7e9178d,
            0x8b40b65347cfeffb, 0xfce9281a9381a55f, 0xfde34f9f228fc03f, 0x8c46656aa79eba9d,
            0x1ed0d3f416073189, 0xd7adcc20a26d48d1, 0x2429dcfa355eddba, 0xec100f2285aaad68,
            0x91a83984506e1ef4, 0x4c10c0f973e3cba5, 0x45d0d0ad9ab6890e, 0xa52b22d88ddb6090,
            0x63f7e7549bf80c43, 0xfb03f87e5ea7137d, 0x822f96594246a4aa, 0x42242b1335cd3424,
            0xf78652fc51ec76ac, 0x24db7314bda69cc5, 0xcce4cf66737c8427, 0xffd70eeca33ed90f,
            0xc154aff2caddd546, 0x59d47a8ccd59e1bb, 0xabf793045ca561f8, 0x3f1486708729b21d,
            0x76ed98409f3f9abe, 0x3f0bb2cd7cedd012, 0x448f78da1713ac85, 0xddbae7151c1578b2,
            0xcf94237ec0973cd7, 0x76a0657cedebac81, 0x2b13b564bed7a3b3, 0x47a6fc0f4604c781,
            0x22acf016523ae80f, 0xf728771b939c13a2, 0xab4aee3986c80ec8, 0x61d8c8c918b3fe52,
            0x7a40380c747f9044, 0xfaf974af2e96a882, 0xb8bd56d90c69d42c, 0x7cea307dda515497,
            0x56d0858a27ded2a3, 0x8717ea17698706b7, 0x6b34d0c0587e8867, 0x387a8142ee80d29a,
        ]
        let random = Pcg64Random(seed: 0, stream: 0)
        for expected in canon {
            let actual = random.next()
            try #require(actual == expected)
        }
    }

    @Test func canon_seed_11_stream_6341068275337658369() throws {
        // pcg64 rng(11, 6341068275337658369); rng();
        let canon: [UInt64] = [
            0x4505e3f8eb807d75, 0xe9d99c43e94a2a60, 0x2fac2c2ee95f4d74, 0x3bed4c3dbefa75d1,
            0x4a8c34b144bdf691, 0xadeac01f9503e06b, 0x392c22557ca227c0, 0xf41d6de650fdf8c3,
            0x84974b0c0aa707f1, 0xbe94f6f4f81d4e12, 0xaa3d18b2b3529568, 0x7bb5ad63fd30cc48,
            0xc013be7a0200f1c3, 0x6a877c343bfd6c08, 0xa920dad0f81dbefc, 0xece3e6f7e8b9fdc0,
            0xb049320da008b100, 0xcbddd419dbaafdb6, 0x4d408ea0b3d14752, 0x7a9b60bd8e7588f9,
            0xa049acfe16f7caaf, 0x09f31236a170e76d, 0x3524b61b35ab14ba, 0xb3602fb2726aa978,
            0xc7ec9e5a4fd6bb0d, 0x6c546004e2d8c326, 0x3ad18542d874d951, 0x32c63e25ff9b4151,
            0xa4d56f30e9c7b74b, 0x941f0d6b2da20e88, 0xc5c653404521b2a6, 0xab00c49b69dc6553,
            0x40fc76b1a8f5ebd8, 0x474044911ffc0c73, 0xfd5d64eb68b35aa4, 0xb94189851722f449,
            0x8bddb6326537e049, 0x0e220074bfccdf81, 0xf83e4307a3839383, 0x9a8d71cc446d223c,
            0xa0e4173a0765ec18, 0x280b5a8eace0f3f9, 0x40a0b355f62d48bb, 0x902c0098328476fd,
            0x44b7402d2c474562, 0xb2687adf0b897112, 0xbc37324dce316ce7, 0x8ac82fb011d68336,
            0xba18895c709e2480, 0x119169a20f3d2282, 0xd062418e538f6bd1, 0x99e6fe41c9c99e83,
            0x838877f852e8d46c, 0x01137a19a6f22883, 0xd84854a181934c87, 0xa378b8429d169aac,
            0x47566eb170486fde, 0x10be9e4f86947f4b, 0x2f58e843896c1e8c, 0x4cae8e4f980bc7a6,
            0xe8007a3fc93dbf92, 0x980131e76ad7a630, 0x3ba6fffd97b76e16, 0xad475ace42d03863,
            0xaf9f1db8f797cae0, 0x80276dc4ab5424d5, 0x02b1f28f91c7c024, 0x7e3202c964d2e66a,
            0x06e5db992f2fc211, 0x12e3557dc1f66f6f, 0x7486dd5d1006188b, 0xfa1856e505861051,
            0x90595cef6d47f49f, 0x9ecb0fe6bd4115c6, 0xf537c91f9a90b199, 0x86ad39b65d0a62ba,
            0x954ad037c2ca232e, 0x99fc8385731d5907, 0x3ac7705150b9f240, 0x49c03d8b85fff9c9,
        ]
        let random = Pcg64Random(seed: 11, stream: 6341068275337658369)
        for expected in canon {
            let actual = random.next()
            try #require(actual == expected)
        }
    }

    @Test func multi_threading() async {
        let seed = Int.random(in: .min ... .max)
        let sampleCount = 100000

        let expected: Set<UInt64>
        do {
            let randomExpected = Pcg64Random(seed: seed)
            expected = Set((0..<sampleCount).map { _ in randomExpected.next() })
        }

        let random = Pcg64Random(seed: seed)

        let results = await confirmation(expectedCount: sampleCount) { confirmation in
            await withTaskGroup(of: UInt64.self) { group in
                for _ in 0 ..< sampleCount {
                    group.addTask {
                        confirmation()
                        return random.next()
                    }
                    if group.isCancelled {
                        break
                    }
                }

                var results = Set<UInt64>()
                for await value in group {
                    results.insert(value)
                }
                return results
            }
        }

        #expect(results == expected, "seed: \(seed), samples: \(sampleCount)")
    }

    @Test func multi_threading_advance() async {
        let seed = Int.random(in: .min ... .max)
        let sampleCount = 100000

        let expected: UInt64
        do {
            let randomExpected = Pcg64Random(seed: seed)
            for _ in 0..<sampleCount {
                randomExpected.advance(by: 1)
            }
            expected = randomExpected.next()
        }

        let random = Pcg64Random(seed: seed)

        await confirmation(expectedCount: sampleCount) { confirmation in
            await withDiscardingTaskGroup { group in
                for _ in 0 ..< sampleCount {
                    group.addTask {
                        random.advance(by: 1)
                        confirmation()
                    }
                    if group.isCancelled {
                        break
                    }
                }
            }
        }

        let result = random.next()

        #expect(result == expected, "seed: \(seed), samples: \(sampleCount)")
    }

    @Test func backstep_u64() {
        // pcg64 rng(0); rng.backstep(1); rng();
        let random = Pcg64Random(seed: 0)

        random.backstep(by: 1)
        let result = random.next()

        #expect(result == 5591422465364813936)
    }
}

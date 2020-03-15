Pod::Spec.new do |s|
  s.name             = 'PcgRandom'
  s.version          = '1.0.2'
  s.summary          = 'PCG Pseudorandom Number Generator'
  s.homepage         = 'https://github.com/paiv/swift-pcg-random'
  s.license          = 'MIT'
  s.author           = 'Pavel Ivashkov'
  s.source           = { :git => 'https://github.com/paiv/swift-pcg-random.git', :tag => s.version.to_s }
  s.macos.deployment_target = '10.10'
  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/PcgRandom/**/*.swift'

  s.subspec 'PcgRandomC' do |cs|
      cs.source_files = 'Sources/PcgRandomC/**/*.{h,hpp,c,cpp}'
      cs.public_header_files = 'Sources/PcgRandomC/include/**/*.h'
  end

end

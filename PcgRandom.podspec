Pod::Spec.new do |s|
  s.name             = 'PcgRandom'
  s.version          = ENV['PCGRANDOM_VERSION'] || '1.0'
  s.summary          = 'PCG Pseudorandom Number Generator'
  s.homepage         = 'https://github.com/paiv/swift-pcg-random'
  s.license          = 'MIT'
  s.author           = 'Pavel Ivashkov'
  s.source           = { :git => 'https://github.com/paiv/swift-pcg-random.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'
  s.macos.deployment_target = '10.13'
  s.ios.deployment_target = '12.0'

  s.source_files = 'Sources/PcgRandom/**/*.swift'

  s.subspec 'PcgRandomC' do |cs|
      cs.source_files = 'Sources/PcgRandomC/**/*.{h,hpp,c,cpp}'
      cs.public_header_files = 'Sources/PcgRandomC/include/**/*.h'
  end

end

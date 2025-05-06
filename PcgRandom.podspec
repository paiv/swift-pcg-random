Pod::Spec.new do |s|
  s.name             = 'PcgRandom'
  s.version          = ENV['PCGRANDOM_VERSION'] || '1.0'
  s.summary          = 'PCG Pseudorandom Number Generator'
  s.homepage         = 'https://github.com/paiv/swift-pcg-random'
  s.license          = 'MIT'
  s.author           = 'Pavel Ivashkov'
  s.source           = { :git => 'https://github.com/paiv/swift-pcg-random.git', :tag => s.version.to_s }
  s.swift_version    = '6.1'
  s.macos.deployment_target = '15.0'
  s.ios.deployment_target = '18.0'
  s.watchos.deployment_target = '11.0'

  s.source_files = 'Sources/PcgRandom/**/*.swift'

end

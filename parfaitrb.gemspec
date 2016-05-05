# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "parfaitrb"
  spec.version       = '0.0.1'
  spec.authors       = ["Ryan Doyle"]
  spec.email         = ["ryan@doylenet.net"]
  spec.summary       = %q{Performance Co-Pilot agent for Ruby applications}
  spec.description   = %q{Performance metrics for Ruby applications}
  spec.homepage      = "https://github.com/ryandoyle/parfaitrb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # spec.add_dependency "mmap"
  spec.add_dependency "ffi"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end

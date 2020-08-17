# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "psst"
  spec.version       = "0.1.0"
  spec.authors       = ["Jeremy Woertink"]
  spec.email         = ["jeremywoertink@gmail.com"]
  spec.summary       = %q{Encrypt/Decrypt strings}
  spec.description   = %q{Encrypt/Decrypt strings}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["./psst.rb"]
end
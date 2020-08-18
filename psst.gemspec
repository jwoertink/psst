# coding: utf-8
lib = File.expand_path('../ruby/lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "psst"
  spec.version       = "0.2.0"
  spec.authors       = ["Jeremy Woertink"]
  spec.email         = ["jeremywoertink@gmail.com"]
  spec.summary       = %q{Encrypt/Decrypt strings}
  spec.description   = %q{Encrypt/Decrypt strings}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["ruby/lib"]
end
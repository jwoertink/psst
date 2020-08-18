# psst

> psst...c'mere. lemme tell you a secret...

Ever needed to create an encrypted string in your Rails app, and decrypt it in your Lucky app? Yeah, me too. There's lots of solutions for encrypting strings, but they all focus on being within the same app.

Thankfully, both Ruby and Crystal support OpenSSL, but it's a bit confusing to use and figure out. All this library does is use the native OpenSSL with minimal setup so you don't have to go digging around docs in several different places.

## Installation

### Crystal

Add to your shards.yml

```yaml
dependencies:
  psst:
    github: jwoertink/psst
    branch: master
```

In your Crystal

```crystal
require "psst/crystal/src/psst"

Psst.config do |c|
  # must be 8 bytes
  c.salt = "12345678"
  # must be 16 bytes
  c.iv = "1234567890abcdef"
  c.password = "shhsecret"
end

token = Psst.new.encrypt("secret message")
puts Psst.new.decrypt("iREBySRcG8bc80YZoOpB3Q==")
```

### Ruby

Add to your Gemfile

```ruby
gem 'psst', git: 'https://github.com/jwoertink/psst.git'
```

In your Ruby

```ruby
Psst.config do |c|
  # must be 8 bytes
  c.salt = "12345678"
  # must be 16 bytes
  c.iv = "1234567890abcdef"
  c.password = "shhsecret"
end

token = Psst.new.encrypt("secret message")
puts Psst.new.decrypt("iREBySRcG8bc80YZoOpB3Q==")
```
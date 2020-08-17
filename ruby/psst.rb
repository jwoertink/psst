require "openssl"
require "base64"

class Psst
  class Configuration
    attr_reader :salt, :iv, :password

    def salt=(value)
      if value.nil? || value.length != 8
        raise "Salt must be exactly 8 bytes. Use `SecureRandom.random_bytes(8)`."
      end
      @salt = value
    end

    def iv=(value)
      if value.nil? || value.length != 16
        raise "The IV must be exactly 16 bytes. Use `SecureRandom.random_bytes(16)`."
      end
      @iv = value
    end

    def password=(value)
      if value.nil? || value.length < 8
        raise "Your password must be 8 or more bytes"
      end
      @password = value
    end

    def key
      @key ||= OpenSSL::PKCS5.pbkdf2_hmac(password, salt, 100_000, 256 / 8, "SHA256")
    end
  end

  CONFIG = Configuration.new
  MODE = "aes-256-cbc"

  def self.config
    yield CONFIG
  end

  def initialize
    @cipher = OpenSSL::Cipher.new(MODE)
  end

  # Returns Base64 encoded encrypted string
  def encrypt(plaintext)
    @cipher.encrypt
    @cipher.key = CONFIG.key
    @cipher.iv = CONFIG.iv
    encrypted = @cipher.update(plaintext) + @cipher.final
    Base64.urlsafe_encode64(encrypted)
  end

  # decodes token and returns plaintext
  def decrypt(base64token)
    text = Base64.decode64(base64token)
    @cipher.decrypt
    @cipher.key = CONFIG.key
    @cipher.iv = CONFIG.iv
    decrypted = @cipher.update(text) + @cipher.final
    decrypted
  end
end
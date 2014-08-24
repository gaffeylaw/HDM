require "openssl"
class Dip::Des

  KEY = "efc482e0e29d012f6788000c2903110b"
  IV = "fb6b9ec0e29d012f6788000c2903110b"
  CIPHER = "DES"

  def self.encrypt(plaintext)
    c = OpenSSL::Cipher::Cipher.new(CIPHER)
    c.encrypt
    c.key = KEY
    c.iv = IV
    ret = c.update(plaintext)
    ret << c.final
  end

  def self.decrypt(encrypt_value)
    c = OpenSSL::Cipher::Cipher.new(CIPHER)
    c.decrypt
    c.key = KEY
    c.iv = IV
    ret = c.update(encrypt_value)
    ret << c.final
  end
end
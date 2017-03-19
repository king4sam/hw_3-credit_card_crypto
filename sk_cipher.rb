# frozen_string_literal: true
require 'rbnacl/libsodium'
require 'base64'

#  ModernSymmetricCipher
module ModernSymmetricCipher
  def self.generate_new_key
    key = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
    Base64.encode64(key)
    # TODO: Return a new key as a Base64 string
  end

  def self.encrypt(document, key)
    simple_box = RbNaCl::SimpleBox.from_secret_key(Base64.decode64(key))
    ciphertext = simple_box.encrypt(document)
    Base64.encode64(ciphertext)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
  end

  def self.decrypt(aes_crypt, key)
    simple_box = RbNaCl::SimpleBox.from_secret_key(Base64.decode64(key))
    simple_box.decrypt(Base64.decode64(aes_crypt))
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
  end
end

# SubstitutionCipher
module SubstitutionCipher
  # Caesar cipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      encrypted_str = ''
      document.each_char do |char|
        encrypted_str << (char.ord + key).chr
      end
      encrypted_str
      # TODO: encrypt string using caesar cipher
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      decrypted_str = ''
      document.each_char do |char|
        decrypted_str << (char.ord - key).chr
      end
      decrypted_str
      # TODO: decrypt string using caesar cipher
    end
  end
  # Permutation cipher
  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      encrypted_str = ''
      random_permutation = Array(0..127).shuffle(random: Random.new(key))
      document.to_s.each_char do |char|
        encrypted_str << random_permutation[char.ord].chr
      end
      encrypted_str
      # TODO: encrypt string using a permutation cipher
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      decrypted_str = ''
      random_permutation = Array(0..127).shuffle(random: Random.new(key))
      document.each_char do |char|
        decrypted_str << random_permutation.find_index(char.ord).chr
      end
      decrypted_str
      # TODO: decrypt string using a permutation cipher
    end
  end
end

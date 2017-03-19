require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher.rb'
require_relative '../sk_cipher.rb'
require 'minitest/autorun'

describe 'Test card info encryption' do
  before do
    @cc = CreditCard.new('4916603231464963', 'Mar-30-2020', 'Soumya Ray', 'Visa')
    @key = 3
  end

  describe 'Using Caesar cipher' do
    it 'should encrypt card information' do
      enc = SubstitutionCipher::Caesar.encrypt(@cc.to_s, @key)
      enc.wont_equal @cc.to_s
      enc.wont_be_nil
    end

    it 'should decrypt text' do
      enc = SubstitutionCipher::Caesar.encrypt(@cc.to_s, @key)
      dec = SubstitutionCipher::Caesar.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end

  describe 'Using Permutation cipher' do
    it 'should encrypt card information' do
      enc = SubstitutionCipher::Permutation.encrypt(@cc.to_s, @key)
      enc.wont_equal @cc.to_s
      enc.wont_be_nil
    end

    it 'should decrypt text' do
      enc = SubstitutionCipher::Permutation.encrypt(@cc.to_s, @key)
      dec = SubstitutionCipher::Permutation.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end

  # TODO: Add tests for double transposition and AES ciphers
  #       Can you DRY out the tests using metaprogramming? (see lecture slide)
  describe 'Using Double Tansposition cipher' do
    it 'should encrypt card information' do
      encrypt_context = DoubleTranspositionCipher.encrypt(@cc.to_s, @key)
      encrypt_context.wont_equal @cc.to_s
      encrypt_context.wont_be_nil
    end

    it 'should decrypt text' do
      encrypt_context = DoubleTranspositionCipher.encrypt(@cc.to_s, @key)
      decrypt_context = DoubleTranspositionCipher.decrypt(encrypt_context, @key)
      decrypt_context.must_equal @cc.to_s
    end
  end

  describe 'Using ModernSymmetricCipher' do
    it 'should generate a new Base64 string key' do
      new_key = ModernSymmetricCipher.generate_new_key
      new_key.must_be_kind_of String
      new_key.wont_be_nil
      new_key.wont_be_empty
    end

    it 'should encrypt card information' do
      new_key = ModernSymmetricCipher.generate_new_key
      enc = ModernSymmetricCipher.encrypt(@cc.to_s, new_key)
      enc.wont_equal @cc.to_s
      enc.wont_be_nil
    end

    it 'should decrypt text' do
      new_key = ModernSymmetricCipher.generate_new_key
      enc = ModernSymmetricCipher.encrypt(@cc.to_s, new_key)
      dec = ModernSymmetricCipher.decrypt(enc, new_key)
      dec.must_equal @cc.to_s
    end
  end
end

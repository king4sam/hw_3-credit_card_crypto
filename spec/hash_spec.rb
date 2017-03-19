require_relative '../credit_card'
require 'minitest/autorun'

# Feel free to replace the contents of cards with data from your own yaml file
card_details = [
  { num: '4916603231464963', exp: 'Mar-30-2020', name: 'Soumya Ray', net: 'Visa' },
  { num: '6011580789725897', exp: 'Sep-30-2020', name: 'Nick Danks', net: 'Visa' },
  { num: '5423661657234057', exp: 'Feb-30-2020', name: 'Lee Chen', net: 'Mastercard' }
]

cards = card_details.map { |c| CreditCard.new(c[:num], c[:exp], c[:name], c[:net]) }

describe 'Test hashing requirements' do

  describe 'Test regular hashing' do
    describe 'Check hashes are consistently produced' do
      it 'should be the same and not nil' do
        db = cards.map {|c| [c,c.clone] }
        db.each do |cp|
          cp.first.hash.wont_be_nil
          cp.last.hash.wont_be_nil
          cp.first.hash.must_equal cp.last.hash
        end
      end
      # TODO: Check that each card produces the same hash if hashed repeatedly
    end

    describe 'Check for unique hashes' do
      it 'should be different for different cards' do
        cards.combination(2).to_a.each do |cmp|
          cmp.first.hash.wont_be_nil
          cmp.last.hash.wont_be_nil
          cmp.first.hash.wont_equal cmp.last.hash
        end
      end
      # TODO: Check that each card produces a different hash than other cards
    end
  end

  describe 'Test cryptographic hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
    end

    describe 'Check regular hash not same as cryptographic hash' do
      # TODO: Check that each card's hash is different from its hash_secure
    end
  end
end

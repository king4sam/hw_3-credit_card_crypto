module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext

    rows = Math.sqrt(document.length).ceil
    cols = (document.length.to_f/row).ceil

    ex_document = document.length < rows * cols ?  document.ljust(rows * cols, ' ') : document

    matrix = ex_document.chars.each_slice(cols).to_a
    row_shuffle_index = (0...rows).to_a.shuffle(random: Random.new(key))
    cols_shuffle_index = (0...cols).to_a.shuffle(random: Random.new(key))

    matrix.sort_by!.with_index do |_,index|
      row_shuffle_index[index]
    end

    matrix.each do |row|
      row.sort_by!.with_index do |_,index|
        cols_shuffle_index[index]
      end
    end

    matrix.inject('') do |encrypt_doc, row|
      encrypt_doc << row.join
    end
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    ciphertext
  end

end

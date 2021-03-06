# DoubleTranspositionCipher
module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    rows, cols = cal_rowcol(document)
    nsquare = document.length < rows * cols
    ex_document = nsquare ? document.ljust(rows * cols, "\n") : document

    matrix = ex_document.chars.each_slice(cols).to_a
    rows_index, cols_index = rowcol_shuffle_index(rows, cols, key)

    # shuffle rows
    matrix.sort_by!.with_index { |_, index| rows_index[index] }

    # shuffle cols
    matrix.each do |row|
      row.sort_by!.with_index { |_, index| cols_index[index] }
    end

    # rebuild String
    matrix.inject('') { |encrypt_doc, row| encrypt_doc << row.join }
  end

  def self.decrypt(ciphertext, key)
    rows, cols = cal_rowcol(ciphertext)

    matrix = ciphertext.chars.each_slice(cols).to_a

    r_idx, c_idx = rowcol_shuffle_index(rows, cols, key)

    # cols recover
    matrix.each do |row|
      row.sort_by!.with_index { |_, shuffled_ord| c_idx.index(shuffled_ord) }
    end

    # rows recover
    matrix.sort_by!.with_index { |_, shuffled_ord| r_idx.index(shuffled_ord) }

    # rebuild String
    matrix.inject('') { |doc, row| doc << row.join }.delete("\n")
    # remove additional whitespace char
    # TODO: FILL THIS IN!
  end

  def self.cal_rowcol(document)
    rows = Math.sqrt(document.length).ceil
    cols = (document.length.to_f / rows).ceil

    [rows, cols]
  end

  def self.rowcol_shuffle_index(rows, cols, key)
    [
      (0...rows).to_a.shuffle(random: Random.new(key)),
      (0...cols).to_a.shuffle(random: Random.new(key))
    ]
  end
end

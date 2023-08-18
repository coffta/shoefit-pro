class FootLengthCalculator
  def self.calculate(foot_length_right, foot_length_left)
    longer_length = [foot_length_right, foot_length_left].max
    calculate_length(longer_length)
  end

 private

  def self.calculate_length(foot_length)
    case foot_length
    when 103..107
      '10.5cm'
    when 108..112
      '11cm'
    when 113..117
      '11.5cm'
    when 118..122
      '12cm'
    when 123..127
      '12.5cm'
    when 128..132
      '13.0cm'
    when 133..137
      '13.5cm'
    when 138..142
      '14cm'
    when 143..147
      '14.5cm'
    when 148..152
      '15cm'
    when 153..157
      '15.5cm'
    when 158..162
      '16cm'
    when 163..167
      '16.5cm'
    when 168..172
      '17cm'
    when 173..177
      '17.5cm'
    when 178..182
      '18cm'
    when 183..192
      '18.5cm'
    when 193..197
      '19cm'
    when 198..202
      '20cm'
    when 203..207
      '20.5cm'
    when 208..212
      '21cm'
    when 213..217
      '21.5cm'
    when 218..222
      '22cm'
    when 223..227
      '22.5cm'
    when 228..232
      '23cm'
    when 233..237
      '23.5cm'
    when 238..242
      '24cm'
    when 243..247
      '24.5cm'
    when 248..252
      '25cm'
    when 253..257
      '25.5cm'
    when 258..262
      '26cm'
    when 263..267
      '26.5cm'
    when 268..272
      '27cm'
    when 273..277
      '27.5cm'
    when 278..282
      '28cm'
    when 283..287
      '28.5cm'
    when 288..292
      '29cm'
    when 293..297
      '29.5cm'
    when 298..302
      '30cm'
    when 303..307
      '30.5cm'
    else
      'サイズが取得できません'
    end
  end
end
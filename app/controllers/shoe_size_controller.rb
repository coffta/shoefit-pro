class ShoeSizeController < ApplicationController
skip_before_action :verify_authenticity_token

  def calculate

    # 入力値をセッションに保存
    session[:input_values] = {
      foot_length_right: params[:foot_length_right],
      foot_length_left: params[:foot_length_left],
      foot_width_load_right: params[:foot_width_load_right],
      foot_width_load_left: params[:foot_width_load_left],
      foot_girth_load_right: params[:foot_girth_load_right],
      foot_girth_load_left: params[:foot_girth_load_left],
      foot_width_nonload_right: params[:foot_width_nonload_right],
      foot_width_nonload_left: params[:foot_width_nonload_left],
      foot_girth_nonload_right: params[:foot_girth_nonload_right],
      foot_girth_nonload_left: params[:foot_girth_nonload_left],
      toe_shape_right: params[:toe_shape_right],
      toe_shape_left: params[:toe_shape_left],
      gender: params[:gender]
    }

    @input_values = session[:input_values]
  
    # 入力された足の長さを取得
    foot_length_right = params[:foot_length_right].to_i
    foot_length_left = params[:foot_length_left].to_i

    # FootLengthCalculatorクラスのcalculateメソッドを呼び出し、計算結果を取得
    @calculated_length = calculate_foot_length(foot_length_right, foot_length_left)
   
    # 入力された性別、足幅,爪先形状を取得
    gender = params[:gender].to_s
    toe_shape_right = params[:toe_shape_right].to_s
    toe_shape_left = params[:toe_shape_left].to_s
    foot_width_load_right = params[:foot_width_load_right].to_i
    foot_width_load_left = params[:foot_width_load_left].to_i
    foot_width_nonload_right = params[:foot_width_nonload_right].to_i
    foot_width_nonload_left = params[:foot_width_nonload_left].to_i    

    # 足幅の計算結果を取得
    @calculated_width_load_right = calculate_foot_width(gender, foot_length_right, foot_width_load_right)
    @calculated_width_load_left = calculate_foot_width(gender, foot_length_left, foot_width_load_left)
    @calculated_width_nonload_right = calculate_foot_width(gender, foot_length_right, foot_width_nonload_right)
    @calculated_width_nonload_left = calculate_foot_width(gender, foot_length_left, foot_width_nonload_left)

    # 入力された足囲を取得
    foot_girth_load_right = params[:foot_girth_load_right].to_i
    foot_girth_load_left = params[:foot_girth_load_left].to_i
    foot_girth_nonload_right = params[:foot_girth_nonload_right].to_i
    foot_girth_nonload_left = params[:foot_girth_nonload_left].to_i

    # 日付を取得（今日の日付を使用）
    @foot_measured_date = Date.today

    # 足囲の計算結果を取得
    @calculated_girth_load_right = calculate_foot_girth(gender, foot_length_right, foot_girth_load_right)
    @calculated_girth_load_left = calculate_foot_girth(gender, foot_length_left, foot_girth_load_left)
    @calculated_girth_nonload_right = calculate_foot_girth(gender, foot_length_right, foot_girth_nonload_right)
    @calculated_girth_nonload_left = calculate_foot_girth(gender, foot_length_left, foot_girth_nonload_left)

    # 計算結果をセッションに保存
    session[:calculated_values] = {
      calculated_length: @calculated_length,
      calculated_width_load_right: @calculated_width_load_right,
      calculated_width_load_left: @calculated_width_load_left,
      calculated_girth_load_right: @calculated_girth_load_right,
      calculated_girth_load_left: @calculated_girth_load_left,
      calculated_width_nonload_right: @calculated_width_nonload_right,
      calculated_width_nonload_left: @calculated_width_nonload_left,
      calculated_girth_nonload_right: @calculated_girth_nonload_right,
      calculated_girth_nonload_left: @calculated_girth_nonload_left
    }

    @calculated_values = session[:calculated_values]

   # モデルを使用してデータベースに保存
   ShoeSize.create(
    foot_length_right: foot_length_right,
    foot_length_left: foot_length_left,
    calculated_length: @calculated_length,
    gender: gender,
    toe_shape_right: toe_shape_right,
    toe_shape_left: toe_shape_left,
    foot_width_load_right: foot_width_load_right,
    foot_width_load_left: foot_width_load_left,
    foot_width_nonload_right: foot_width_nonload_right,
    foot_width_nonload_left: foot_width_nonload_left,
    foot_girth_load_right: foot_girth_load_right,
    foot_girth_load_left: foot_girth_load_left,
    foot_girth_nonload_right: foot_girth_nonload_right,
    foot_girth_nonload_left: foot_girth_nonload_left,
    calculated_width_load_right: @calculated_width_load_right,
    calculated_width_load_left: @calculated_width_load_left,
    calculated_girth_load_right: @calculated_girth_load_right,
    calculated_girth_load_left: @calculated_girth_load_left,
    calculated_width_nonload_right: @calculated_width_nonload_right,
    calculated_width_nonload_left: @calculated_width_nonload_left,
    calculated_girth_nonload_right: @calculated_girth_nonload_right,
    calculated_girth_nonload_left: @calculated_girth_nonload_left,
    foot_measured_date: @foot_measured_date
   )
    render "result/shoe_size_result"
  end

  private

  def calculate_foot_length(foot_length_right, foot_length_left)
    longer_length = [foot_length_right, foot_length_left].max
    calculate_length(longer_length)
  end

  def calculate_length(foot_length)
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

  def calculate_foot_width(gender, foot_length, foot_width)
    # セッションから入力値を取得
    input_values = session[:input_values]
    # ビューから送信されたパラメータを取得
    selected_gender = params[:gender]

    # 条件２：params ハッシュ内のキーに foot_length または foot_width に関する情報が含まれていない場合、処理が終了します（return 文が実行されます）。
    unless foot_length && foot_width
      return
    end
    
    width_chart = case gender
    when "male"
      {
        "A" => [[198..202, 78..79], [203..207, 80..81], [208..212, 81..82], [213..217, 82..83], [218..222, 83..84], [223..227, 84..85], [228..232, 86..87], [233..237, 87..88], [238..242, 88..89], [243..247, 89..90], [248..252, 91..92], [253..257, 92..93], [258..262, 93..94], [263..267, 94..95], [268..272, 95..96], [273..277, 97..98], [278..282, 98..99], [283..287, 99..100], [288..292, 100..101], [293..297, 102..103], [298..302, 103..104], [303..307, 104..105]],
        "B" => [[198..202, 80..81], [203..207, 82..83], [208..212, 83..84], [213..217, 84..85], [218..222, 85..86], [223..227, 86..87], [228..232, 88..89], [233..237, 89..90], [238..242, 90..91], [243..247, 91..92], [248..252, 93..94], [253..257, 94..95], [258..262, 95..96], [263..267, 96..97], [268..272, 97..99], [273..277, 99..100], [278..282, 100..101], [283..287, 101..102], [288..292, 102..103], [293..297, 104..105], [298..302, 105..106], [303..307, 106..107]],
        "C" => [[198..202, 82..83], [203..207, 84..85], [208..212, 85..86], [213..217, 86..87], [218..222, 87..88], [223..227, 88..89], [228..232, 90..91], [233..237, 91..92], [238..242, 92..93], [243..247, 93..94], [248..252, 95..96], [253..257, 96..97], [258..262, 97..98], [263..267, 98..99], [268..272, 100..101], [273..277, 101..102], [278..282, 102..103], [283..287, 103..104], [288..292, 104..105], [293..297, 106..107], [298..302, 107..108], [303..307, 108..109]],
        "D" => [[198..202, 84..85], [203..207, 86..87], [208..212, 87..88], [213..217, 88..89], [218..222, 89..90], [223..227, 90..92], [228..232, 92..93], [233..237, 93..94], [238..242, 94..95], [243..247, 95..96], [248..252, 97..98], [253..257, 98..99], [258..262, 99..100], [263..267, 100..101], [268..272, 102..103], [273..277, 103..104], [278..282, 104..105], [283..287, 105..106], [288..292, 106..107], [293..297, 108..109], [298..302, 109..110], [303..307, 110..111]],
        "E" => [[198..202, 86..87], [203..207, 88..89], [208..212, 89..90], [213..217, 90..91], [218..222, 91..92], [223..227, 93..94], [228..232, 94..95], [233..237, 95..96], [238..242, 96..97], [243..247, 97..98], [248..252, 99..100], [253..257, 100..101], [258..262, 101..102], [263..267, 102..103], [268..272, 104..105], [273..277, 105..106], [278..282, 106..107], [283..287, 107..108], [288..292, 108..110], [293..297, 110..111], [298..302, 111..112], [303..307, 112..113]],
        "2E" => [[198..202, 88..89], [203..207, 90..91], [208..212, 91..92], [213..217, 92..93], [218..222, 93..94], [223..227, 95..96], [228..232, 96..97], [233..237, 97..98], [238..242, 98..99], [243..247, 99..100], [248..252, 101..102], [253..257, 102..103], [258..262, 103..104], [263..267, 104..105], [268..272, 106..107], [273..277, 107..108], [278..282, 108..109], [283..287, 109..110], [288..292, 111..112], [293..297, 112..113], [298..302, 113..114], [303..307, 114..115]],
        "3E" => [[198..202, 90..91], [203..207, 92..93], [208..212, 93..94], [213..217, 94..95], [218..222, 95..96], [223..227, 97..98], [228..232, 98..99], [233..237, 99..100], [238..242, 100..101], [243..247, 101..103], [248..252, 103..104], [253..257, 104..105], [258..262, 105..106], [263..267, 106..107], [268..272, 108..109], [273..277, 109..110], [278..282, 110..111], [283..287, 111..112], [288..292, 113..114], [293..297, 114..115], [298..302, 115..116], [303..307, 116..117]],
        "4E" => [[198..202, 92..93], [203..207, 94..95], [208..212, 95..96], [213..217, 96..97], [218..222, 97..98], [223..227, 99..100], [228..232, 100..101], [233..237, 101..102], [238..242, 102..103], [243..247, 104..105], [248..252, 105..106], [253..257, 106..107], [258..262, 107..108], [263..267, 108..109], [268..272, 110..111], [273..277, 111..112], [278..282, 112..113], [283..287, 113..114], [288..292, 115..116], [293..297, 116..117], [298..302, 117..118], [303..307, 118..119]],
        "F" => [[198..202, 94..96], [203..207, 96..97], [208..212, 97..98], [213..217, 98..99], [218..222, 99..100], [223..227, 101..102], [228..232, 102..103], [233..237, 103..104], [238..242, 104..105], [243..247, 106..107], [248..252, 107..108], [253..257, 108..109], [258..262, 109..110], [263..267, 110..111], [268..272, 112..113], [273..277, 113..114], [278..282, 114..115], [283..287, 115..116], [288..292, 117..118], [293..297, 118..119], [298..302, 119..120], [303..307, 120..121]],
        "G" => [[198..202, 97..98], [203..207, 98..99], [208..212, 99..100], [213..217, 100..101], [218..222, 101..102], [223..227, 103..104], [228..232, 104..105], [233..237, 105..106], [238..242, 106..107], [243..247, 108..109], [248..252, 109..110], [253..257, 110..111], [258..262, 111..112], [263..267, 112..114], [268..272, 114..115], [273..277, 115..116], [278..282, 116..117], [283..287, 117..118], [288..292, 119..120], [293..297, 120..121], [298..302, 121..122], [303..307, 122..123]]
      }
  
    when "female"
      {
        "A" => [[193..197, 75..76], [198..202, 77..78], [203..207, 78..79], [208..212, 79..80], [213..217, 80..81], [218..222, 82..83], [223..227, 83..84], [228..232, 84..85], [233..237, 85..86], [238..242, 87..88], [243..247, 88..89], [248..252, 89..90], [253..257, 90..91], [258..262, 92..93], [263..267, 93..94], [268..272, 94..95]],
        "B" => [[193..197, 77..78], [198..202, 79..80], [203..207, 80..81], [208..212, 81..82], [213..217, 82..83], [218..222, 84..85], [223..227, 85..86], [228..232, 86..87], [233..237, 87..89], [238..242, 89..90], [243..247, 90..91], [248..252, 91..92], [253..257, 92..94], [258..262, 94..95], [263..267, 95..96], [268..272, 96..97]],
        "C" => [[193..197, 79..81], [198..202, 81..82], [203..207, 82..83], [208..212, 83..84], [213..217, 84..86], [218..222, 86..87], [223..227, 87..88], [228..232, 88..89], [233..237, 90..91], [238..242, 91..92], [243..247, 92..93], [248..252, 93..94], [253..257, 95..96], [258..262, 96..97], [263..267, 97..98], [268..272, 98..99]],
        "D" => [[193..197, 82..83], [198..202, 83..84], [203..207, 84..85], [208..212, 85..86], [213..217, 87..88], [218..222, 88..89], [223..227, 89..90], [228..232, 90..91], [233..237, 92..93], [238..242, 93..94], [243..247, 94..95], [248..252, 95..96], [253..257, 97..98], [258..262, 98..99], [263..267, 99..100], [268..272, 100..102]],
        "E" => [[193..197, 84..85], [198..202, 85..86], [203..207, 86..87], [208..212, 87..88], [213..217, 89..90], [218..222, 90..91], [223..227, 91..92], [228..232, 92..94], [233..237, 94..95], [238..242, 95..96], [243..247, 96..97], [248..252, 97..99], [253..257, 99..100], [258..262, 100..101], [263..267, 101..102], [268..272, 103..104]],
        "2E" => [[193..197, 86..87], [198..202, 87..88], [203..207, 88..89], [208..212, 89..91], [213..217, 91..92], [218..222, 92..93], [223..227, 93..94], [228..232, 95..96], [233..237, 96..97], [238..242, 97..98], [243..247, 98..99], [248..252, 100..101], [253..257, 101..102], [258..262, 102..103], [263..267, 103..104], [268..272, 105..106]],
        "3E" => [[193..197, 88..89], [198..202, 89..90], [203..207, 90..91], [208..212, 92..93], [213..217, 93..94], [218..222, 94..95], [223..227, 95..96], [228..232, 97..98], [233..237, 98..99], [238..242, 99..100], [243..247, 100..101], [248..252, 102..103], [253..257, 103..104], [258..262, 104..105], [263..267, 105..107], [268..272, 107..108]],
        "4E" => [[193..197, 90..91], [198..202, 91..92], [203..207, 92..93], [208..212, 94..95], [213..217, 95..96], [218..222, 96..97], [223..227, 97..99], [228..232, 99..100], [233..237, 100..101], [238..242, 101..102], [243..247, 102..104], [248..252, 104..105], [253..257, 105..106], [258..262, 106..107], [263..267, 108..109], [268..272, 109..110]],
        "F" => [[193..197, 92..93], [198..202, 93..94], [203..207, 94..96], [208..212, 96..97], [213..217, 97..98], [218..222, 98..99], [223..227, 100..101], [228..232, 101..102], [233..237, 102..103], [238..242, 103..104], [243..247, 105..106], [248..252, 106..107], [253..257, 107..108], [258..262, 108..109], [263..267, 110..111], [268..272, 111..112]]
      }
  
    else "chileren"
      {
        "A" => [[103..107, 37..38], [108..112, 39..40], [113..117, 40..41], [118..122, 42..43], [123..127, 44..45], [128..132, 45..46], [133..137, 47..48], [138..142, 49..50], [143..147, 51..52], [148..152, 53..54], [153..157, 54..55], [158..162, 56..57], [163..167, 57..58], [168..172, 59..60], [173..177, 61..62], [178..182, 62..63], [183..187, 64..65], [188..192, 66..67], [193..197, 67..68], [198..202, 69..70], [203..207, 71..72], [208..212, 73..74], [213..217, 74..75], [218..222, 76..77], [223..227, 78..79], [228..232, 79..80], [233..237, 81..82], [238..242, 83..84], [243..247, 84..85], [248..252, 86..87], [253..257, 88..89], [258..262, 89..90]],
        "B" => [[103..107, 39..40], [108..112, 41..42], [113..117, 42..43], [118..122, 44..45], [123..127, 46..47], [128..132, 47..49], [133..137, 49..50], [138..142, 51..52], [143..147, 53..54], [148..152, 54..55], [153..157, 56..57], [158..162, 58..59], [163..167, 59..60], [168..172, 61..62], [173..177, 63..64], [178..182, 64..65], [183..187, 66..67], [188..192, 68..69], [193..197, 69..71], [198..202, 71..72], [203..207, 73..74], [208..212, 75..76], [213..217, 76..77], [218..222, 78..79], [223..227, 80..81], [228..232, 81..82], [233..237, 83..84], [238..242, 85..86], [243..247, 86..87], [248..252, 88..89], [253..257, 90..91], [258..262, 91..93]],
        "C" => [[103..107, 41..42], [108..112, 43..44], [113..117, 44..46], [118..122, 46..47], [123..127, 48..49], [128..132, 50..51], [133..137, 51..52], [138..142, 53..54], [143..147, 55..56], [148..152, 56..57], [153..157, 58..59], [158..162, 60..61], [163..167, 61..64], [168..172, 63..64], [173..177, 65..66], [178..182, 66..68], [183..187, 68..69], [188..192, 70..71], [193..197, 72..73], [198..202, 73..74], [203..207, 75..76], [208..212, 77..78], [213..217, 78..79], [218..222, 80..81], [223..227, 82..83], [228..232, 83..85], [233..237, 85..86], [238..242, 87..88], [243..247, 88..90], [248..252, 90..91], [253..257, 92..93], [258..262, 94..95]],
        "D" => [[103..107, 43..44], [108..112, 45..46], [113..117, 47..48], [118..122, 48..49], [123..127, 50..51], [128..132, 52..53], [133..137, 53..54], [138..142, 55..56], [143..147, 57..58], [148..152, 58..60], [153..157, 60..61], [158..162, 62..63], [163..167, 64..65], [168..172, 65..66], [173..177, 67..68], [178..182, 69..70], [183..187, 70..71], [188..192, 72..73], [193..197, 74..75], [198..202, 75..76], [203..207, 77..78], [208..212, 79..80], [213..217, 80..82], [218..222, 82..83], [223..227, 84..85], [228..232, 86..87], [233..237, 87..88], [238..242, 89..90], [243..247, 91..92], [248..252, 92..93], [253..257, 94..95], [258..262, 96..97]],
        "E" => [[103..107, 45..46], [108..112, 47..48], [113..117, 49..50], [118..122, 50..51], [123..127, 52..53], [128..132, 54..55], [133..137, 55..57], [138..142, 57..58], [143..147, 59..60], [148..152, 61..62], [153..157, 62..63], [158..162, 64..65], [163..167, 66..67], [168..172, 67..68], [173..177, 69..70], [178..182, 71..72], [183..187, 72..73], [188..192, 74..75], [193..197, 76..77], [198..202, 77..79], [203..207, 79..80], [208..212, 81..82], [213..217, 83..84], [218..222, 84..85], [223..227, 86..87], [228..232, 88..89], [233..237, 89..90], [238..242, 91..92], [243..247, 93..94], [248..252, 94..95], [253..257, 96..97], [258..262, 98..99]],
        "2E" => [[103..107, 47..48], [108..112, 49..50], [113..117, 51..52], [118..122, 52..54], [123..127, 54..55], [128..132, 56..57], [133..137, 58..59], [138..142, 59..60], [143..147, 61..62], [148..152, 63..64], [153..157, 64..65], [158..162, 66..67], [163..167, 68..69], [168..172, 69..70], [173..177, 71..72], [178..182, 73..74], [183..187, 74..76], [188..192, 76..77], [193..197, 78..79], [198..202, 80..81], [203..207, 81..82], [208..212, 83..84], [213..217, 85..86], [218..222, 86..87], [223..227, 88..89], [228..232, 90..91], [233..237, 91..92], [238..242, 93..94], [243..247, 95..96], [248..252, 96..98], [253..257, 98..99], [258..262, 100..101]],
        "3E" => [[103..107, 49..51], [108..112, 51..52], [113..117, 53..54], [118..122, 55..56], [123..127, 56..57], [128..132, 58..59], [133..137, 60..61], [138..142, 61..62], [143..147, 63..64], [148..152, 65..66], [153..157, 66..67], [158..162, 68..69], [163..167, 70..71], [168..172, 71..73], [173..177, 73..74], [178..182, 75..76], [183..187, 77..78], [188..192, 78..79], [193..197, 80..81], [198..202, 82..83], [203..207, 83..84], [208..212, 85..86], [213..217, 87..88], [218..222, 88..89], [223..227, 90..91], [228..232, 92..93], [233..237, 93..95], [238..242, 95..96], [243..247, 97..98], [248..252, 99..100], [253..257, 100..101], [258..262, 102..103]],
        "4E" => [[103..107, 52..53], [108..112, 53..54], [113..117, 55..56], [118..122, 57..58], [123..127, 58..59], [128..132, 60..61], [133..137, 62..63], [138..142, 63..64], [143..147, 65..66], [148..152, 67..68], [153..157, 68..70], [158..162, 70..71], [163..167, 72..73], [168..172, 74..75], [173..177, 75..76], [178..182, 77..78], [183..187, 79..80], [188..192, 80..81], [193..197, 82..83], [198..202, 84..85], [203..207, 85..86], [208..212, 87..88], [213..217, 89..90], [218..222, 90..92], [223..227, 92..93], [228..232, 94..95], [233..237, 96..97], [238..242, 97..98], [243..247, 99..100], [248..252, 101..102], [253..257, 102..103], [258..262, 104..105]],
        "F" => [[103..107, 54..55], [108..112, 55..56], [113..117, 57..58], [118..122, 59..60], [123..127, 60..61], [128..132, 62..63], [133..137, 64..65], [138..142, 65..67], [143..147, 67..68], [148..152, 69..70], [153..157, 71..72], [158..162, 72..73], [163..167, 74..75], [168..172, 76..77], [173..177, 77..78], [178..182, 79..80], [183..187, 81..82], [188..192, 82..83], [193..197, 84..85], [198..202, 86..87], [203..207, 87..89], [208..212, 89..90], [213..217, 91..92], [218..222, 93..94], [223..227, 94..95], [228..232, 96..97], [233..237, 98..99], [238..242, 99..100], [243..247, 101..102], [248..252, 103..104], [253..257, 104..105], [258..262, 106..107]],
        "G" => [[103..107, 56..57], [108..112, 57..58], [113..117, 59..60], [118..122, 61..62], [123..127, 62..63], [128..132, 64..65], [133..137, 66..67], [138..142, 68..69], [143..147, 69..70], [148..152, 71..72], [153..157, 73..74], [158..162, 74..75], [163..167, 76..77], [168..172, 78..79], [173..177, 79..80], [178..182, 81..82], [183..187, 83..84], [188..192, 84..85], [193..197, 86..87], [198..202, 88..89], [203..207, 90..91], [208..212, 91..92], [213..217, 93..94], [218..222, 95..96], [223..227, 96..97], [228..232, 98..99], [233..237, 100..101], [238..242, 101..102], [243..247, 103..104], [248..252, 105..106], [253..257, 106..107], [258..262, 108..109]]
      } 
    end

    # 条件１：(foot_length, foot_width)の組み合わせのパターンを定義
    patterns = [
      [input_values[:foot_length_right].to_i, input_values[:foot_width_load_right].to_i],
      [input_values[:foot_length_right].to_i, input_values[:foot_width_nonload_right].to_i],
      [input_values[:foot_length_left].to_i, input_values[:foot_width_load_left].to_i],
      [input_values[:foot_length_left].to_i, input_values[:foot_width_nonload_left].to_i]
    ]

    # 条件１：指定された組み合わせに合致するものを探す
    selected_range = width_chart.find do |size, ranges|
      ranges.any? { |range| range[0].include?(foot_length) && range[1].include?(foot_width) }
    end

    selected_range ? selected_range[0] : nil
  end

  def calculate_foot_girth(gender, foot_length, foot_girth)

    # セッションから入力値を取得
    input_values = session[:input_values]

    # ビューから送信されたパラメータを取得
    selected_gender = params[:gender]


    # 条件２：params ハッシュ内のキーに foot_length または foot_girth に関する情報が含まれていない場合、処理が終了します（return 文が実行されます）。
    unless foot_length && foot_girth
      return
    end

    girth_chart = case gender
    when "male"
      {
        "A" => [[198..202, 186..191], [203..207, 189..194], [208..212, 192..197], [213..217, 195..200], [218..222, 198..203], [223..227, 201..206], [228..232, 204..209], [233..237, 207..212], [238..242, 210..215], [243..247, 213..218], [248..252, 216..221], [253..257, 219..224], [258..262, 222..227], [263..267, 225..230], [268..272, 228..233], [273..277, 231..236], [278..282, 234..239], [283..287, 237..242], [288..292, 240..245], [293..297, 243..248], [298..302, 246..251], [303..307, 249..254]],
        "B" => [[198..202, 192..197], [203..207, 195..200], [208..212, 198..203], [213..217, 201..206], [218..222, 204..209], [223..227, 207..212], [228..232, 210..215], [233..237, 213..218], [238..242, 216..221], [243..247, 219..224], [248..252, 222..227], [253..257, 225..230], [258..262, 228..233], [263..267, 231..236], [268..272, 234..239], [273..277, 237..242], [278..282, 240..245], [283..287, 243..248], [288..292, 246..251], [293..297, 249..254], [298..302, 252..257], [303..307, 255..260]],
        "C" => [[198..202, 198..203], [203..207, 201..206], [208..212, 204..209], [213..217, 207..212], [218..222, 210..215], [223..227, 213..218], [228..232, 216..221], [233..237, 219..224], [238..242, 222..227], [243..247, 225..230], [248..252, 228..233], [253..257, 231..236], [258..262, 234..239], [263..267, 237..242], [268..272, 240..245], [273..277, 243..248], [278..282, 246..251], [283..287, 249..254], [288..292, 252..257], [293..297, 255..260], [298..302, 258..263], [303..307, 261..266]],
        "D" => [[198..202, 204..209], [203..207, 207..212], [208..212, 210..215], [213..217, 213..218], [218..222, 216..221], [223..227, 219..224], [228..232, 222..227], [233..237, 225..230], [238..242, 228..233], [243..247, 231..236], [248..252, 234..239], [253..257, 237..242], [258..262, 240..245], [263..267, 243..248], [268..272, 246..251], [273..277, 249..254], [278..282, 252..257], [283..287, 255..260], [288..292, 258..263], [293..297, 261..266], [298..302, 264..269], [303..307, 267..272]],
        "E" => [[198..202, 210..215], [203..207, 213..218], [208..212, 216..221], [213..217, 219..224], [218..222, 222..227], [223..227, 215..230], [228..232, 228..233], [233..237, 231..236], [238..242, 234..239], [243..247, 237..242], [248..252, 240..245], [253..257, 243..248], [258..262, 246..251], [263..267, 249..254], [268..272, 252..257], [273..277, 255..260], [278..282, 258..263], [283..287, 261..266], [288..292, 264..269], [293..297, 267..272], [298..302, 270..275], [303..307, 273..278]],
        "2E" => [[198..202, 216..221], [203..207, 219..224], [208..212, 222..227], [213..217, 225..230], [218..222, 228..233], [223..227, 231..236], [228..232, 234..239], [233..237, 237..242], [238..242, 240..245], [243..247, 243..248], [248..252, 246..251], [253..257, 249..254], [258..262, 252..257], [263..267, 255..260], [268..272, 258..263], [273..277, 261..266], [278..282, 264..269], [283..287, 267..272], [288..292, 270..275], [293..297, 273..278], [298..302, 276..281], [303..307, 279..284]],
        "3E" => [[198..202, 222..227], [203..207, 225..230], [208..212, 228..232], [213..217, 231..236], [218..222, 234..239], [223..227, 237..242], [228..232, 240..245], [233..237, 243..248], [238..242, 246..251], [243..247, 249..254], [248..252, 252..257], [253..257, 255..260], [258..262, 258..263], [263..267, 261..266], [268..272, 264..269], [273..277, 267..272], [278..282, 270..275], [283..287, 273..278], [288..292, 276..281], [293..297, 279..284], [298..302, 282..287], [303..307, 285..290]],
        "4E" => [[198..202, 228..233], [203..207, 231..236], [208..212, 234..239], [213..217, 237..242], [218..222, 240..245], [223..227, 243..248], [228..232, 246..251], [233..237, 249..254], [238..242, 252..257], [243..247, 255..260], [248..252, 258..263], [253..257, 261..266], [258..262, 264..269], [263..267, 267..272], [268..272, 270..275], [273..277, 273..278], [278..282, 276..281], [283..287, 279..284], [288..292, 282..287], [293..297, 285..290], [298..302, 288..293], [303..307, 291..296]],
        "F" => [[198..202, 234..239], [203..207, 237..242], [208..212, 240..245], [213..217, 243..248], [218..222, 246..251], [223..227, 249..254], [228..232, 252..257], [233..237, 255..260], [238..242, 258..263], [243..247, 261..266], [248..252, 264..269], [253..257, 267..272], [258..262, 270..275], [263..267, 273..278], [268..272, 276..281], [273..277, 279..284], [278..282, 282..287], [283..287, 285..290], [288..292, 288..293], [293..297, 291..296], [298..302, 294..299], [303..307, 297..302]],
        "G" => [[198..202, 240..245], [203..207, 243..246], [208..212, 246..251], [213..217, 249..254], [218..222, 252..257], [223..227, 255..260], [228..232, 258..263], [233..237, 261..266], [238..242, 264..269], [243..247, 267..272], [248..252, 270..275], [253..257, 273..278], [258..262, 276..281], [263..267, 279..284], [268..272, 282..287], [273..277, 285..290], [278..282, 288..293], [283..287, 291..296], [288..292, 294..299], [293..297, 297..302], [298..302, 300..305], [303..307, 303..308]]
      }
    when "female"
      {
        "A" => [[193..197, 180..185], [198..202, 183..188], [203..207, 186..191], [208..212, 189..194], [213..217, 192..197], [218..222, 195..200], [223..227, 198..203], [228..232, 201..206], [233..237, 204..209], [238..242, 207..212], [243..247, 210..215], [248..252, 213..218], [253..257, 216..221], [258..262, 219..224], [263..267, 222..227], [268..272, 225..230]],
        "B" => [[193..197, 186..191], [198..202, 189..194], [203..207, 192..197], [208..212, 195..200], [213..217, 198..203], [218..222, 201..206], [223..227, 204..209], [228..232, 207..212], [233..237, 210..215], [238..242, 213..218], [243..247, 216..221], [248..252, 219..224], [253..257, 222..227], [258..262, 225..230], [263..267, 228..233], [268..272, 231..236]],
        "C" => [[193..197, 192..197], [198..202, 195..200], [203..207, 198..203], [208..212, 201..206], [213..217, 204..209], [218..222, 207..212], [223..227, 210..215], [228..232, 213..218], [233..237, 216..221], [238..242, 219..224], [243..247, 222..227], [248..252, 225..230], [253..257, 228..233], [258..262, 231..236], [263..267, 234..239], [268..272, 237..242]],
        "D" => [[193..197, 198..203], [198..202, 201..206], [203..207, 204..209], [208..212, 207..212], [213..217, 210..215], [218..222, 213..218], [223..227, 216..221], [228..232, 219..224], [233..237, 222..227], [238..242, 225..230], [243..247, 228..233], [248..252, 231..236], [253..257, 234..239], [258..262, 237..242], [263..267, 240..245], [268..272, 243..248]],
        "E" => [[193..197, 204..209], [198..202, 207..212], [203..207, 210..215], [208..212, 213..218], [213..217, 216..221], [218..222, 219..224], [223..227, 222..227], [228..232, 225..230], [233..237, 228..233], [238..242, 231..236], [243..247, 234..239], [248..252, 237..242], [253..257, 240..245], [258..262, 243..248], [263..267, 246..251], [268..272, 249..254]],
        "2E" => [[193..197, 210..215], [198..202, 213..218], [203..207, 216..221], [208..212, 219..224], [213..217, 222..227], [218..222, 225..230], [223..227, 228..233], [228..232, 231..236], [233..237, 234..239], [238..242, 237..242], [243..247, 240..245], [248..252, 243..248], [253..257, 246..251], [258..262, 249..254], [263..267, 252..257], [268..272, 255..260]],
        "3E" => [[193..197, 216..221], [198..202, 219..224], [203..207, 222..227], [208..212, 225..230], [213..217, 228..233], [218..222, 231..236], [223..227, 234..239], [228..232, 237..242], [233..237, 240..245], [238..242, 243..248], [243..247, 246..251], [248..252, 249..254], [253..257, 252..257], [258..262, 255..260], [263..267, 258..263], [268..272, 261..266]],
        "4E" => [[193..197, 222..227], [198..202, 225..230], [203..207, 228..233], [208..212, 231..236], [213..217, 234..239], [218..222, 237..242], [223..227, 240..245], [228..232, 243..248], [233..237, 246..251], [238..242, 249..254], [243..247, 252..257], [248..252, 255..260], [253..257, 258..263], [258..262, 261..266], [263..267, 264..269], [268..272, 267..272]],
        "F" => [[193..197, 228..233], [198..202, 231..236], [203..207, 234..239], [208..212, 237..242], [213..217, 240..245], [218..222, 243..248], [223..227, 246..251], [228..232, 249..254], [233..237, 252..257], [238..242, 255..260], [243..247, 258..263], [248..252, 261..266], [253..257, 264..269], [258..262, 267..272], [263..267, 270..275], [268..272, 273..278]]
      }   
    else "children"
      {
        "A" => [[103..107, 89..94], [108..112, 93..98], [113..117, 97..102], [118..122, 101..106], [123..127, 105..110], [128..132, 109..114], [133..137, 113..118], [138..142, 117..122], [143..147, 121..126], [148..152, 125..130], [153..157, 129..134], [158..162, 133..138], [163..167, 137..142], [168..172, 141..146], [173..177, 145..150], [178..182, 149..154], [183..187, 153..158], [188..192, 157..162], [193..197, 161..166], [198..202, 165..170], [203..207, 169..174], [208..212, 173..178], [213..217, 177..182], [218..222, 181..186], [223..227, 185..190], [228..232, 189..194], [233..237, 193..198], [238..242, 197..202], [243..247, 201..206], [248..252, 205..210], [253..257, 211..216], [258..262, 213..218]],
        "B" => [[103..107, 95..100], [108..112, 99..104], [113..117, 103..108], [118..122, 107..112], [123..127, 111..116], [128..132, 115..120], [133..137, 119..124], [138..142, 123..128], [143..147, 127..132], [148..152, 131..136], [153..157, 135..140], [158..162, 139..144], [163..167, 143..148], [168..172, 147..152], [173..177, 151..156], [178..182, 155..160], [183..187, 159..164], [188..192, 163..168], [193..197, 167..172], [198..202, 171..176], [203..207, 175..180], [208..212, 179..184], [213..217, 183..188], [218..222, 187..192], [223..227, 191..196], [228..232, 195..200], [233..237, 199..204], [238..242, 203..208], [243..247, 207..212], [248..252, 211..216], [253..257, 215..220], [258..262, 219..224]],
        "C" => [[103..107, 101..106], [108..112, 105..110], [113..117, 109..114], [118..122, 113..118], [123..127, 117..122], [128..132, 121..126], [133..137, 125..130], [138..142, 129..134], [143..147, 133..138], [148..152, 137..142], [153..157, 141..146], [158..162, 145..150], [163..167, 149..154], [168..172, 153..158], [173..177, 157..162], [178..182, 161..166], [183..187, 165..170], [188..192, 169..174], [193..197, 173..178], [198..202, 177..182], [203..207, 181..186], [208..212, 185..190], [213..217, 189..194], [218..222, 193..198], [223..227, 197..202], [228..232, 201..206], [233..237, 205..210], [238..242, 209..214], [243..247, 213..218], [248..252, 217..222], [253..257, 221..226], [258..262, 225..230]],
        "D" => [[103..107, 107..112], [108..112, 111..116], [113..117, 115..120], [118..122, 119..124], [123..127, 123..128], [128..132, 127..132], [133..137, 131..136], [138..142, 135..140], [143..147, 139..144], [148..152, 143..148], [153..157, 147..152], [158..162, 151..156], [163..167, 155..160], [168..172, 159..164], [173..177, 163..168], [178..182, 167..172], [183..187, 171..176], [188..192, 175..180], [193..197, 179..184], [198..202, 183..188], [203..207, 187..192], [208..212, 191..196], [213..217, 195..200], [218..222, 199..204], [223..227, 203..208], [228..232, 207..212], [233..237, 211..216], [238..242, 215..220], [243..247, 219..224], [248..252, 223..228], [253..257, 227..232], [258..262, 231..236]],
        "E" => [[103..107, 113..118], [108..112, 117..122], [113..117, 121..126], [118..122, 125..130], [123..127, 129..134], [128..132, 133..138], [133..137, 137..142], [138..142, 141..146], [143..147, 145..150], [148..152, 149..154], [153..157, 153..158], [158..162, 157..162], [163..167, 161..166], [168..172, 165..170], [173..177, 169..174], [178..182, 173..178], [183..187, 177..182], [188..192, 181..186], [193..197, 185..190], [198..202, 189..194], [203..207, 193..198], [208..212, 197..202], [213..217, 201..206], [218..222, 205..210], [223..227, 209..214], [228..232, 213..218], [233..237, 217..222], [238..242, 221..226], [243..247, 225..230], [248..252, 229..234], [253..257, 233..238], [258..262, 237..242]],
        "2E" => [[103..107, 119..124], [108..112, 123..128], [113..117, 127..132], [118..122, 131..136], [123..127, 135..140], [128..132, 139..144], [133..137, 143..148], [138..142, 147..152], [143..147, 151..156], [148..152, 155..160], [153..157, 159..164], [158..162, 163..168], [163..167, 167..172], [168..172, 171..176], [173..177, 175..180], [178..182, 179..184], [183..187, 183..188], [188..192, 187..192], [193..197, 191..196], [198..202, 195..200], [203..207, 199..204], [208..212, 203..208], [213..217, 207..212], [218..222, 211..216], [223..227, 215..220], [228..232, 219..224], [233..237, 223..228], [238..242, 227..232], [243..247, 231..236], [248..252, 235..240], [253..257, 239..244], [258..262, 243..248]],
        "3E" => [[103..107, 125..130], [108..112, 129..134], [113..117, 133..138], [118..122, 137..142], [123..127, 141..146], [128..132, 145..150], [133..137, 149..154], [138..142, 153..158], [143..147, 157..162], [148..152, 161..166], [153..157, 165..170], [158..162, 169..174], [163..167, 173..178], [168..172, 177..182], [173..177, 181..186], [178..182, 185..190], [183..187, 189..194], [188..192, 193..198], [193..197, 197..202], [198..202, 201..206], [203..207, 205..210], [208..212, 209..214], [213..217, 213..218], [218..222, 217..222], [223..227, 221..226], [228..232, 225..230], [233..237, 229..234], [238..242, 233..238], [243..247, 237..242], [248..252, 241..246], [253..257, 245..250], [258..262, 249..254]],
        "4E" => [[103..107, 131..136], [108..112, 135..140], [113..117, 139..144], [118..122, 143..148], [123..127, 147..152], [128..132, 151..156], [133..137, 155..160], [138..142, 159..164], [143..147, 163..168], [148..152, 167..172], [153..157, 171..176], [158..162, 175..180], [163..167, 179..184], [168..172, 183..188], [173..177, 187..192], [178..182, 191..196], [183..187, 195..200], [188..192, 199..204], [193..197, 203..208], [198..202, 207..212], [203..207, 211..216], [208..212, 215..220], [213..217, 219..224], [218..222, 223..228], [223..227, 227..232], [228..232, 231..236], [233..237, 235..240], [238..242, 239..244], [243..247, 243..248], [248..252, 247..252], [253..257, 251..256], [258..262, 255..260]],
        "F" => [[103..107, 137..142], [108..112, 141..146], [113..117, 145..150], [118..122, 149..154], [123..127, 153..158], [128..132, 157..162], [133..137, 161..166], [138..142, 165..170], [143..147, 169..174], [148..152, 173..178], [153..157, 177..182], [158..162, 181..186], [163..167, 185..190], [168..172, 189..194], [173..177, 193..198], [178..182, 197..202], [183..187, 201..206], [188..192, 205..210], [193..197, 209..214], [198..202, 213..218], [203..207, 217..222], [208..212, 221..226], [213..217, 225..230], [218..222, 229..234], [223..227, 233..238], [228..232, 237..242], [233..237, 241..246], [238..242, 245..250], [243..247, 249..254], [248..252, 253..258], [253..257, 257..262], [258..262, 261..266]],
        "G" => [[103..107, 143..148], [108..112, 147..152], [113..117, 151..156], [118..122, 155..160], [123..127, 159..164], [128..132, 163..168], [133..137, 167..172], [138..142, 171..176], [143..147, 175..180], [148..152, 179..184], [153..157, 183..188], [158..162, 187..192], [163..167, 191..196], [168..172, 195..200], [173..177, 199..204], [178..182, 203..208], [183..187, 207..212], [188..192, 211..216], [193..197, 215..220], [198..202, 219..224], [203..207, 223..228], [208..212, 227..232], [213..217, 231..236], [218..222, 235..240], [223..227, 239..244], [228..232, 243..248], [233..237, 247..252], [238..242, 251..256], [243..247, 255..260], [248..252, 259..264], [253..257, 263..268], [258..262, 267..272]]
      } 
    end

    # 条件１：(foot_length, foot_girth)の組み合わせのパターンを定義
    patterns = [
      [input_values[:foot_length_right].to_i, input_values[:foot_girth_load_right].to_i],
      [input_values[:foot_length_right].to_i, input_values[:foot_girth_nonload_right].to_i],
      [input_values[:foot_length_left].to_i, input_values[:foot_girth_load_left].to_i],
      [input_values[:foot_length_left].to_i, input_values[:foot_girth_nonload_left].to_i]
    ]

    # 条件１：指定された組み合わせに合致するものを探す
    selected_range = girth_chart.find do |size, ranges|
      ranges.any? { |range| range[0].include?(foot_length) && range[1].include?(foot_girth) }
    end

    selected_range ? selected_range[0] : nil
  end
end
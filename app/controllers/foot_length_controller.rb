class FootLengthController< ApplicationController
  def calculate
    foot_length_right = params[:foot_length_right].to_i
    foot_length_left = params[:foot_length_left].to_i

    # FootLengthCalculatorクラスのcalculateメソッドを呼び出して足長を計算
    calculated_length = FootLengthCalculator.calculate(foot_length_right, foot_length_left)

    # 計算結果をビューに渡す（文字列として表示するために.to_sを追加）
    @calculated_length = calculated_length.to_s
  end
end
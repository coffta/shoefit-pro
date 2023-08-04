class FootLengthController< ApplicationController
  def calculate
    # 入力された足の長さを取得
    foot_length_right = params[:foot_length_right].to_i
    foot_length_left = params[:foot_length_left].to_i

    # FootLengthCalculatorクラスのcalculateメソッドを呼び出し、計算結果を取得
    @calculated_length = FootLengthCalculator.calculate(foot_length_right, foot_length_left)
    # 計算結果を表示するためのビューファイルを表示
    render "customers/index_logged_in"
  end
end
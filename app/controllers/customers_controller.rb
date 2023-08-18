class CustomersController < ApplicationController
  before_action :check_user_signed_in, only: :index

  def index
    # ログインしている場合の処理はビューに委ねるため、ここでは何もしない
  end

  def index_logged_in
    # ログイン後のトップページのコードを追加
    render 'index_logged_in'
  end

  private

  def check_user_signed_in
    if user_signed_in?
      # ログインしている場合の処理
      # 例えば、ログイン後の表示をするビューを表示する
      render :index_logged_in
    else
      # ログインしていない場合の処理
      # 通常のindexページを表示する
      render :index
    end
  end
end

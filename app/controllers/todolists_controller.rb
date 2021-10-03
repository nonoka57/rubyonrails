class TodolistsController < ApplicationController
  def new
    #  viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end
  
  # 以下を追加
  def create
    # 1. データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # トップ画面へリダイレクト
    redirect_to '/top'
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:gititle,:body)
  end
  
end

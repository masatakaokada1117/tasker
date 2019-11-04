class ApplicationController < ActionController::Base
  # クロスサイトリクエストフォージェリ (CSRF)への対応策のコード
  protect_from_forgery with: :exception
  # サインアウトしたらサインイン・サインアップページ以外のページにいけないようにする
  before_action :authenticate_user!
  # devise_controllerのみ実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # nameカラムを保存できるようにする
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end

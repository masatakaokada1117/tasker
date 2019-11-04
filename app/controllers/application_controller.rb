class ApplicationController < ActionController::Base
  # サインアウトしたらサインイン・サインアップページ以外のページにいけないようにする
  before_action :authenticate_user!
end

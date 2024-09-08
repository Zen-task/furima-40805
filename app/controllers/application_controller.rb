class ApplicationController < ActionController::Base
  # Deviseのコントローラーが呼び出された場合にのみ、configure_permitted_parametersを実行する
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Deviseのストロングパラメーターを設定
  def configure_permitted_parameters
    # サインアップ時に許可するパラメーターを指定
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [
                                        :nickname, :email, :password, :password_confirmation,
                                        :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date
                                      ])
  end
end
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        :nickname,
        :name,
        :address,
        :phone_number,
      ]
    )

    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [
        :nickname,
        :name,
        :address,
        :phone_number,
      ]
    )
  end
end

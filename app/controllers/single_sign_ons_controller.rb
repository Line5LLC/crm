class SingleSignOnsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  layout false

  def create
    Rails.logger.error(".....TESTE.....")

    token = cookies[:crm_sso_token]

    Rails.logger.error(token)

    user = User.find_by(sso_token: token) if token

    Rails.logger.error(user.sso_token)
    Rails.logger.error(user.id)
    if user
      sign_in(user)
      after_sign_in_path_for(user)
    else
      Rails.logger.error("Token inválido ou usuário não encontrado.")
    end
    redirect_to root_path
  end
end

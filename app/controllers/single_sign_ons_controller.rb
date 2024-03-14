class SingleSignOnsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  layout false

  def create
    token = cookies[:crm_sso_token]
    # token = cookies[:sso_token]
    return unless token

    # user = User.find_by(sso_token: params[:token])
    user = User.find_by(sso_token: token)
    if user
      sign_in(user)
      after_sign_in_path_for(user)
    end
    redirect_to root_path
  end
end

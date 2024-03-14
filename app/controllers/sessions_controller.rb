# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
class SessionsController < Devise::SessionsController
  respond_to :html
  append_view_path 'app/views/devise'

  def after_sign_out_path_for(*)
    new_user_session_path
  end

  # # GET /resource/sign_in
  # def new
  #   byebug
  #   token = request.headers["Authorization"]&.split(" ")&.last
  #   if token
  #     @current_user = User.find_by(sso_token: token)
  #     if @current_user
  #       self.resource = @current_user
  #       set_flash_message!(:notice, :signed_in)
  #       sign_in(:user, @current_user)
  #       resource.after_database_authentication
  #       respond_with @current_user, location: after_sign_in_path_for(@current_user)
  #     else
  #       super
  #     end
  #   else
  #     super
  #   end
  # end

  # # POST /resource/sign_in
  # def create
  #   byebug
  #   self.resource = warden.authenticate!({:scope=>:user, :recall=>"sessions#new"})
  #   set_flash_message!(:notice, :signed_in)
  #   sign_in(resource_name, resource)
  #   yield resource if block_given?
  #   respond_with resource, location: after_sign_in_path_for(resource)
  # end
end

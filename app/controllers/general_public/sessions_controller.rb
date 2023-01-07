# frozen_string_literal: true

class GeneralPublic::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :general_customer_state, only: [:create]


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  def after_sign_in_path_for(resource)
    general_public_path
  end

  def after_sign_out_path_for(resource)
    general_public_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


protected
def general_customer_state
  @general_customer = GeneralCustomer.find_by(email: params[:general_customer][:email])
  return if !@general_customer
  if @general_customer.valid_password?(params[:general_customer][:password]) && @general_customer.is_deleted == true
    redirect_to general_public_path
  end
end
end

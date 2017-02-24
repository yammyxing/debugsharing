class Users::SessionsController < Devise::SessionsController
  prepend_before_action :valify_captcha!, only: [:create]

  def valify_captcha!
    unless verify_rucaptcha?
      redirect_to new_user_session_path, alert: t('rucaptcha.invalid')
      return
    end
    true
  end
  
# before_action :configure_sign_in_params, only: [:create]

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

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

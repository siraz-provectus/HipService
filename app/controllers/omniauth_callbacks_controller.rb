class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!
	def facebook
  	@user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
    	flash.notice = "Добро пожаловать"
      sign_in_and_redirect @user
    else
      session["devise.facebook_data"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end
end
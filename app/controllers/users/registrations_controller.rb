class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    params[:user].permit(:first_name, :last_name, :mobile, :gender, :date_of_birth)
    super
    # super do |user|
    #   user.first_name = params[:user][:first_name]
    #   user.last_name = params[:user][:last_name]
    #   user.mobile = params[:user][:mobile]
    #   user.gender = params[:user][:gender]
    #   user.date_of_birth = params[:user][:date_of_birth]
    #   # user.save
    # end
  end

  # GET /resource/edit
  def edit

  end

  # PUT /resource
  def update
    params[:user].permit(:first_name, :last_name, :mobile, :gender, :date_of_birth)
    super
    # super do |user|
    #   user.first_name = params[:user][:first_name]
    #   user.last_name = params[:user][:last_name]
    #   user.mobile = params[:user][:mobile]
    #   user.gender = params[:user][:gender]
    #   user.date_of_birth = params[:user][:date_of_birth]
    #   # user.save
    # end
  end
    # def after_update_path_for(resource)
    #   root_path
    # end
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

  private
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :mobile, :gender, :date_of_birth, :email, :password, :password_confirmation, :current_password)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :mobile, :gender, :date_of_birth, :email, :password, :password_confirmation, :current_password)
    end
end

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :authorize_admin!
  skip_before_action :require_no_authentication, only: [ :new, :create ]

  def new
    build_resource({})
    respond_with resource
  end

  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?

    if resource.persisted?
      flash[:notice] = "User created successfully."
      redirect_to root_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def authorize_admin!
    redirect_to root_path, alert: "Access denied." unless current_user&.admin?
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :dob, :full_name)
  end
end

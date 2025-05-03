class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def admin
    redirect_to root_path, alert: "Access Denied" unless current_user.super_admin?
  end

  def doctor
    redirect_to root_path, alert: "Access Denied" unless current_user.doctor?
  end

  def receptionist
    redirect_to root_path, alert: "Access Denied" unless current_user.receptionist?
  end
end

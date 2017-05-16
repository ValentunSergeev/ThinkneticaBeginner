class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  protected

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'You have no permissions to view this page.'
    end
  end
end
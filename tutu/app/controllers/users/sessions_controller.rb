class Users::SessionsController < Devise::SessionsController
  after_action :welcome_message, only: [:create]

  private

  def welcome_message
    flash[:notice] = "Hi, #{current_user.first_name} #{current_user.last_name}"
  end
end
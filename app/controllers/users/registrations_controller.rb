# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  after_action :assign_admin_role, only: :create, if: :user_created?

  protected

  def assign_admin_role
    user = User.find_by(email: resource.email)
    if User.count == 1
      user.update(role: 'admin') 
    end
  end

  def user_created?
    resource.persisted?
  end
end
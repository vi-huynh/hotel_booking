module Users
  class Updator < ApplicationService
    input :user
    input :username
    input :email
    input :password
    input :password_confirmation
    input :roles

    output :user 

    def call 
      ActiveRecord::Base.transaction do 
        update_basic_user
        update_password
        update_roles
      end
      self.user = user
    end

    private
    def update_roles 
      roles.split(',').each do |role|
        user.add_role(role.to_sym)
      end
    end 

    def update_basic_user
      user.update!(username: username, email: email)
    end
    
    def update_password
      if password.present? && password_confirmation.present?
        user.password = password
        user.password_confirmation = password_confirmation
        user.save!
      end 
    end 
  end 
end 
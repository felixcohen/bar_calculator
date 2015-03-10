module ControllerMacros
  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:user]
    admin = FactoryGirl.create(:user)
    admin.admin = true
    admin.save
    sign_in admin # Using factory girl as an example
  end

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end
end
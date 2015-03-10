require 'rails_helper'

describe UsersController, type: :controller do
  describe "get admin" do
    it "denies normal users" do
      login_user
      user = create(:user)
      get :edit, {:id => user.to_param}
      response.code.should == "403"
    end
  end

  describe "get admin as admin" do
    it "allow admins" do
      login_admin
      user = create(:user)
      get :edit, {:id => user.to_param}
      response.code.should == "200"
    end
  end
end
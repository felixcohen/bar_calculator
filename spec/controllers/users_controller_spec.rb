require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "get admin" do
    it "denies normal users" do
      login_user
      user = create(:user)
      get :edit, {:id => user.to_param}
      expect(response.code).to eq("403")
    end
  end

  describe "get admin as admin" do
    it "allow admins" do
      login_admin
      user = create(:user)
      get :edit, {:id => user.to_param}
      expect(response.code).to eq("200")
    end
  end
end
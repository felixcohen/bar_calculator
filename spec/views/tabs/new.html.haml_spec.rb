require 'rails_helper'

RSpec.describe "tabs/new", type: :view do
  before(:each) do
    assign(:tab, Tab.new(
      :name => "MyString",
      :status => "MyString",
      :paid => false
    ))
  end

  it "renders new tab form" do
    render

    assert_select "form[action=?][method=?]", tabs_path, "post" do

      assert_select "input#tab_name[name=?]", "tab[name]"

      assert_select "input#tab_status[name=?]", "tab[status]"

      assert_select "input#tab_paid[name=?]", "tab[paid]"
    end
  end
end

require 'spec_helper'

describe "drinks/edit" do
  before(:each) do
    @drink = assign(:drink, stub_model(Drink,
      :name => "MyString",
      :cost => 1.5
    ))
  end

  it "renders the edit drink form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", drink_path(@drink), "post" do
      assert_select "input#drink_name[name=?]", "drink[name]"
      assert_select "input#drink_cost[name=?]", "drink[cost]"
    end
  end
end

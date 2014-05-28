require 'spec_helper'

describe "discounts/edit" do
  before(:each) do
    @discount = assign(:discount, stub_model(Discount,
      :amount => 1.5
    ))
  end

  it "renders the edit discount form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", discount_path(@discount), "post" do
      assert_select "input#discount_amount[name=?]", "discount[amount]"
    end
  end
end

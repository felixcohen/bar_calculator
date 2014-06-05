require 'spec_helper'

describe "discounts/index" do
  before(:each) do
    assign(:discounts, [
      stub_model(Discount,
        :amount => 1.5
      ),
      stub_model(Discount,
        :amount => 1.5
      )
    ])
  end

  it "renders a list of discounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
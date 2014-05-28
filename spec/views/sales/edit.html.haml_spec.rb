require 'spec_helper'

describe "sales/edit" do
  before(:each) do
    @sale = assign(:sale, stub_model(Sale,
      :drink_id => 1
    ))
  end

  it "renders the edit sale form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sale_path(@sale), "post" do
      assert_select "input#sale_drink_id[name=?]", "sale[drink_id]"
    end
  end
end

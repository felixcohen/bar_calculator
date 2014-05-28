require 'spec_helper'

describe "sales/new" do
  before(:each) do
    assign(:sale, stub_model(Sale,
      :drink_id => 1
    ).as_new_record)
  end

  it "renders new sale form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sales_path, "post" do
      assert_select "input#sale_drink_id[name=?]", "sale[drink_id]"
    end
  end
end

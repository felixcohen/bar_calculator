require 'spec_helper'

describe "drinks/show" do
  before(:each) do
    @drink = assign(:drink, stub_model(Drink,
      :name => "Name",
      :cost => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1.5/)
  end
end

require 'rails_helper'

RSpec.describe "tabs/show", type: :view do
  before(:each) do
    @tab = assign(:tab, Tab.create!(
      :name => "Name",
      :status => "Status",
      :paid => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/false/)
  end
end

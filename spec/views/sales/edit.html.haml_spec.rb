require 'spec_helper'

describe "sales/edit" do
  before(:each) do
    @sale = assign(:sale, stub_model(Sale,
      :product_id => 1
    ))
  end

end

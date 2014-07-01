require 'spec_helper'

describe Sale do
  it { should validate_presence_of(:product_id) }
end

require 'spec_helper'

describe Sale do
  it { is_expected.to validate_presence_of(:product_id) }
end

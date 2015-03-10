require 'spec_helper'

describe Discount do
  it { is_expected.to validate_presence_of(:amount) }
  it { is_expected.to validate_presence_of(:business_id) }
end

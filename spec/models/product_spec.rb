require 'spec_helper'

describe Product do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:cost) }
  it { is_expected.to validate_presence_of(:business_id) }

end

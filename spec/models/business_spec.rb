require 'spec_helper'

describe Business do
  it { is_expected.to validate_presence_of(:name) }
end

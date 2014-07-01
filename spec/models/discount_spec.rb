require 'spec_helper'

describe Discount do
  it { should validate_presence_of(:amount) }
end

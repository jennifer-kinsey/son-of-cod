require 'rails_helper'

describe Review do
  it { should validate_presence_of :rating }
  it { should validate_presence_of :comment }
  it { should belong_to :product }
  it { expect validate_length_of(:comment).is_at_least(4) }
  it { expect validate_length_of(:comment).is_at_most(1000) }
  it { expect validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
  it { expect validate_numericality_of(:rating).is_greater_than_or_equal_to(1) }
end

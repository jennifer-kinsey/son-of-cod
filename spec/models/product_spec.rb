require 'rails_helper'

describe Product do
  it { expect validate_presence_of :name }
  it { expect validate_presence_of :price }
  it { expect validate_presence_of :date_caught }
  it { expect validate_presence_of :origin }

  it { should have_many :reviews }

end

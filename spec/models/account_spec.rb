require 'rails_helper'

describe Account do
  it { should have_many :orders }
end

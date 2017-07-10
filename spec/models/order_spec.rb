require 'rails_helper'

describe Order do
  it { should have_many :orders_products }
  it { should belong_to :account}
  it { should validate_presence_of :status }
  it { should validate_presence_of :account_id }
  it { should validate_presence_of :total_price }
end

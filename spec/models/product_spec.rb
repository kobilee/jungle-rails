require 'rails_helper'

RSpec.describe Product, type: :model do

  subject {
    described_class.new(name: "Anything", price_cents: 1121,
    quantity: 1, category: Category.new)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price_cents" do
    subject.price_cents = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a quatity" do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a category" do
    subject.category = nil
    expect(subject).to_not be_valid
  end
end
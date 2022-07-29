require 'rails_helper'

user = User.new(first_name: "Luke", last_name: "Skywalker", email: "whereleia@stars.com", password: "x-wings")

RSpec.describe Freelancer, :type => :model do
  subject {
    described_class.new(bio: "Any anything any of anything thing any anything",
                        rate: 150,
                        user: user)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a bio" do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a rate" do
    subject.rate = nil
    expect(subject).to_not be_valid
  end
end
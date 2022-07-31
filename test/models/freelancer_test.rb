require "test_helper"

class FreelancerTest < ActiveSupport::TestCase
  test "full_name returns the first name and last name" do
    user = User.new(first_name: "John", last_name: "Lennon")
    freelancer = Freelancer.new(user: user)
    assert_equal "John Lennon", freelancer.full_name
  end
end

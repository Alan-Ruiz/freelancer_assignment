require "application_system_test_case"

class FreelancersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path
  
    assert_selector "h1", text: "Browse our freelancers"
  end

  test "visiting the show" do
    visit freelancer_path(1)

    assert_selector "h1", text:  "Freelancer Profile"
  end


  test "lets a signed in user create a new freelancer" do
    login_as users(:one)
    visit "/freelancers/new"
    # save_screenshot

    fill_in "freelancer_bio", with: "Qui suscipit quos. Fuga asperiores cum. Sunt et nostrum.Alias amet sint. Reiciendis ad nobis. Ut suscipit consequatur.Sit quasi dolor. Repellat est aut. Reiciendis magni rerum."
    fill_in "freelancer_rate", with: 150
    # save_screenshot

    click_on "Submit"
    # save_screenshot

    assert_text "Freelancer Profile"
  end
end
 
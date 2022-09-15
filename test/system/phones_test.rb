require "application_system_test_case"

class PhonesTest < ApplicationSystemTestCase
  setup do
    @phone = phones(:one)
  end

  test "visiting the index" do
    visit phones_url
    assert_selector "h1", text: "Phones"
  end

  test "should create phone" do
    visit phones_url
    click_on "New phone"

    fill_in "Body", with: @phone.body
    fill_in "Title", with: @phone.title
    click_on "Create Phone"

    assert_text "Phone was successfully created"
    click_on "Back"
  end

  test "should update Phone" do
    visit phone_url(@phone)
    click_on "Edit this phone", match: :first

    fill_in "Body", with: @phone.body
    fill_in "Title", with: @phone.title
    click_on "Update Phone"

    assert_text "Phone was successfully updated"
    click_on "Back"
  end

  test "should destroy Phone" do
    visit phone_url(@phone)
    click_on "Destroy this phone", match: :first

    assert_text "Phone was successfully destroyed"
  end
end

require "application_system_test_case"

class SpecificationsTest < ApplicationSystemTestCase
  setup do
    @specification = specifications(:one)
  end

  test "visiting the index" do
    visit specifications_url
    assert_selector "h1", text: "Specifications"
  end

  test "should create specification" do
    visit specifications_url
    click_on "New specification"

    fill_in "Contract", with: @specification.contract_id
    fill_in "Date", with: @specification.date
    fill_in "Description", with: @specification.description
    fill_in "Number", with: @specification.number
    click_on "Create Specification"

    assert_text "Specification was successfully created"
    click_on "Back"
  end

  test "should update Specification" do
    visit specification_url(@specification)
    click_on "Edit this specification", match: :first

    fill_in "Contract", with: @specification.contract_id
    fill_in "Date", with: @specification.date
    fill_in "Description", with: @specification.description
    fill_in "Number", with: @specification.number
    click_on "Update Specification"

    assert_text "Specification was successfully updated"
    click_on "Back"
  end

  test "should destroy Specification" do
    visit specification_url(@specification)
    click_on "Destroy this specification", match: :first

    assert_text "Specification was successfully destroyed"
  end
end

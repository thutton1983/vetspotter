require "application_system_test_case"

class VeterinariansTest < ApplicationSystemTestCase
  setup do
    @veterinarian = veterinarians(:one)
  end

  test "visiting the index" do
    visit veterinarians_url
    assert_selector "h1", text: "Veterinarians"
  end

  test "creating a Veterinarian" do
    visit veterinarians_url
    click_on "New Veterinarian"

    fill_in "Address", with: @veterinarian.address
    fill_in "Name", with: @veterinarian.name
    fill_in "Phone", with: @veterinarian.phone
    fill_in "Website", with: @veterinarian.website
    click_on "Create Veterinarian"

    assert_text "Veterinarian was successfully created"
    click_on "Back"
  end

  test "updating a Veterinarian" do
    visit veterinarians_url
    click_on "Edit", match: :first

    fill_in "Address", with: @veterinarian.address
    fill_in "Name", with: @veterinarian.name
    fill_in "Phone", with: @veterinarian.phone
    fill_in "Website", with: @veterinarian.website
    click_on "Update Veterinarian"

    assert_text "Veterinarian was successfully updated"
    click_on "Back"
  end

  test "destroying a Veterinarian" do
    visit veterinarians_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Veterinarian was successfully destroyed"
  end
end

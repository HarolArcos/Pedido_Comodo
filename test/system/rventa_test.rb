require "application_system_test_case"

class RventaTest < ApplicationSystemTestCase
  setup do
    @rventum = rventa(:one)
  end

  test "visiting the index" do
    visit rventa_url
    assert_selector "h1", text: "Rventa"
  end

  test "should create rventum" do
    visit rventa_url
    click_on "New rventum"

    fill_in "Direccion", with: @rventum.Direccion
    fill_in "Mail", with: @rventum.Mail
    fill_in "Nombre", with: @rventum.Nombre
    fill_in "Responsable", with: @rventum.Responsable
    fill_in "Telefono", with: @rventum.Telefono
    click_on "Create Rventum"

    assert_text "Rventum was successfully created"
    click_on "Back"
  end

  test "should update Rventum" do
    visit rventum_url(@rventum)
    click_on "Edit this rventum", match: :first

    fill_in "Direccion", with: @rventum.Direccion
    fill_in "Mail", with: @rventum.Mail
    fill_in "Nombre", with: @rventum.Nombre
    fill_in "Responsable", with: @rventum.Responsable
    fill_in "Telefono", with: @rventum.Telefono
    click_on "Update Rventum"

    assert_text "Rventum was successfully updated"
    click_on "Back"
  end

  test "should destroy Rventum" do
    visit rventum_url(@rventum)
    click_on "Destroy this rventum", match: :first

    assert_text "Rventum was successfully destroyed"
  end
end

require "application_system_test_case"

class SupervisorsTest < ApplicationSystemTestCase
  setup do
    @supervisor = supervisors(:one)
  end

  test "visiting the index" do
    visit supervisors_url
    assert_selector "h1", text: "Supervisors"
  end

  test "should create supervisor" do
    visit supervisors_url
    click_on "New supervisor"

    fill_in "Apellido materno", with: @supervisor.Apellido_Materno
    fill_in "Apellido paterno", with: @supervisor.Apellido_Paterno
    fill_in "Dirección", with: @supervisor.Dirección
    fill_in "Mail", with: @supervisor.Mail
    fill_in "Nombre", with: @supervisor.Nombre
    fill_in "Teléfono", with: @supervisor.Teléfono
    click_on "Create Supervisor"

    assert_text "Supervisor was successfully created"
    click_on "Back"
  end

  test "should update Supervisor" do
    visit supervisor_url(@supervisor)
    click_on "Edit this supervisor", match: :first

    fill_in "Apellido materno", with: @supervisor.Apellido_Materno
    fill_in "Apellido paterno", with: @supervisor.Apellido_Paterno
    fill_in "Dirección", with: @supervisor.Dirección
    fill_in "Mail", with: @supervisor.Mail
    fill_in "Nombre", with: @supervisor.Nombre
    fill_in "Teléfono", with: @supervisor.Teléfono
    click_on "Update Supervisor"

    assert_text "Supervisor was successfully updated"
    click_on "Back"
  end

  test "should destroy Supervisor" do
    visit supervisor_url(@supervisor)
    click_on "Destroy this supervisor", match: :first

    assert_text "Supervisor was successfully destroyed"
  end
end

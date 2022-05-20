require "application_system_test_case"

class OrdensTest < ApplicationSystemTestCase
  setup do
    @orden = ordens(:one)
  end

  test "visiting the index" do
    visit ordens_url
    assert_selector "h1", text: "Ordens"
  end

  test "should create orden" do
    visit ordens_url
    click_on "New orden"

    fill_in "Cantidad", with: @orden.cantidad
    fill_in "Nombre", with: @orden.nombre
    fill_in "Precio", with: @orden.precio
    fill_in "Punto venta", with: @orden.punto_venta
    fill_in "Responsable", with: @orden.responsable
    fill_in "Total", with: @orden.total
    click_on "Create Orden"

    assert_text "Orden was successfully created"
    click_on "Back"
  end

  test "should update Orden" do
    visit orden_url(@orden)
    click_on "Edit this orden", match: :first

    fill_in "Cantidad", with: @orden.cantidad
    fill_in "Nombre", with: @orden.nombre
    fill_in "Precio", with: @orden.precio
    fill_in "Punto venta", with: @orden.punto_venta
    fill_in "Responsable", with: @orden.responsable
    fill_in "Total", with: @orden.total
    click_on "Update Orden"

    assert_text "Orden was successfully updated"
    click_on "Back"
  end

  test "should destroy Orden" do
    visit orden_url(@orden)
    click_on "Destroy this orden", match: :first

    assert_text "Orden was successfully destroyed"
  end
end

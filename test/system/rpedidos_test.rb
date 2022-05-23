require "application_system_test_case"

class RpedidosTest < ApplicationSystemTestCase
  setup do
    @rpedido = rpedidos(:one)
  end

  test "visiting the index" do
    visit rpedidos_url
    assert_selector "h1", text: "Rpedidos"
  end

  test "should create rpedido" do
    visit rpedidos_url
    click_on "New rpedido"

    fill_in "Cantidad", with: @rpedido.cantidad
    fill_in "Id producto", with: @rpedido.id_producto
    fill_in "Responsable", with: @rpedido.responsable
    fill_in "Tiendita", with: @rpedido.tiendita
    click_on "Create Rpedido"

    assert_text "Rpedido was successfully created"
    click_on "Back"
  end

  test "should update Rpedido" do
    visit rpedido_url(@rpedido)
    click_on "Edit this rpedido", match: :first

    fill_in "Cantidad", with: @rpedido.cantidad
    fill_in "Id producto", with: @rpedido.id_producto
    fill_in "Responsable", with: @rpedido.responsable
    fill_in "Tiendita", with: @rpedido.tiendita
    click_on "Update Rpedido"

    assert_text "Rpedido was successfully updated"
    click_on "Back"
  end

  test "should destroy Rpedido" do
    visit rpedido_url(@rpedido)
    click_on "Destroy this rpedido", match: :first

    assert_text "Rpedido was successfully destroyed"
  end
end

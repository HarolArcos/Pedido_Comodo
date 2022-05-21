require "test_helper"

class RpedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rpedido = rpedidos(:one)
  end

  test "should get index" do
    get rpedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_rpedido_url
    assert_response :success
  end

  test "should create rpedido" do
    assert_difference("Rpedido.count") do
      post rpedidos_url, params: { rpedido: { cantidad: @rpedido.cantidad, id_producto: @rpedido.id_producto, responsable: @rpedido.responsable, tiendita: @rpedido.tiendita } }
    end

    assert_redirected_to rpedido_url(Rpedido.last)
  end

  test "should show rpedido" do
    get rpedido_url(@rpedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_rpedido_url(@rpedido)
    assert_response :success
  end

  test "should update rpedido" do
    patch rpedido_url(@rpedido), params: { rpedido: { cantidad: @rpedido.cantidad, id_producto: @rpedido.id_producto, responsable: @rpedido.responsable, tiendita: @rpedido.tiendita } }
    assert_redirected_to rpedido_url(@rpedido)
  end

  test "should destroy rpedido" do
    assert_difference("Rpedido.count", -1) do
      delete rpedido_url(@rpedido)
    end

    assert_redirected_to rpedidos_url
  end
end

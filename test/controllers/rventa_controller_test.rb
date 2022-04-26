require "test_helper"

class RventaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rventum = rventa(:one)
  end

  test "should get index" do
    get rventa_url
    assert_response :success
  end

  test "should get new" do
    get new_rventum_url
    assert_response :success
  end

  test "should create rventum" do
    assert_difference("Rventum.count") do
      post rventa_url, params: { rventum: { Direccion: @rventum.Direccion, Mail: @rventum.Mail, Nombre: @rventum.Nombre, Responsable: @rventum.Responsable, Telefono: @rventum.Telefono } }
    end

    assert_redirected_to rventum_url(Rventum.last)
  end

  test "should show rventum" do
    get rventum_url(@rventum)
    assert_response :success
  end

  test "should get edit" do
    get edit_rventum_url(@rventum)
    assert_response :success
  end

  test "should update rventum" do
    patch rventum_url(@rventum), params: { rventum: { Direccion: @rventum.Direccion, Mail: @rventum.Mail, Nombre: @rventum.Nombre, Responsable: @rventum.Responsable, Telefono: @rventum.Telefono } }
    assert_redirected_to rventum_url(@rventum)
  end

  test "should destroy rventum" do
    assert_difference("Rventum.count", -1) do
      delete rventum_url(@rventum)
    end

    assert_redirected_to rventa_url
  end
end

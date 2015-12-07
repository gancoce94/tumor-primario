require 'test_helper'

class TumorsControllerTest < ActionController::TestCase
  setup do
    @tumor = tumors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tumors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tumor" do
    assert_difference('Tumor.count') do
      post :create, tumor: { abdominal: @tumor.abdominal, axilar: @tumor.axilar, cerebro: @tumor.cerebro, cuello: @tumor.cuello, edad: @tumor.edad, genero: @tumor.genero, grado_tumor: @tumor.grado_tumor, higado: @tumor.higado, hueso: @tumor.hueso, mediastino: @tumor.mediastino, medula_osea: @tumor.medula_osea, peritoneum: @tumor.peritoneum, piel: @tumor.piel, pleura: @tumor.pleura, pulmon: @tumor.pulmon, supraclavicular: @tumor.supraclavicular, tipo_histologico: @tumor.tipo_histologico, tipo_tumor: @tumor.tipo_tumor }
    end

    assert_redirected_to tumor_path(assigns(:tumor))
  end

  test "should show tumor" do
    get :show, id: @tumor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tumor
    assert_response :success
  end

  test "should update tumor" do
    patch :update, id: @tumor, tumor: { abdominal: @tumor.abdominal, axilar: @tumor.axilar, cerebro: @tumor.cerebro, cuello: @tumor.cuello, edad: @tumor.edad, genero: @tumor.genero, grado_tumor: @tumor.grado_tumor, higado: @tumor.higado, hueso: @tumor.hueso, mediastino: @tumor.mediastino, medula_osea: @tumor.medula_osea, peritoneum: @tumor.peritoneum, piel: @tumor.piel, pleura: @tumor.pleura, pulmon: @tumor.pulmon, supraclavicular: @tumor.supraclavicular, tipo_histologico: @tumor.tipo_histologico, tipo_tumor: @tumor.tipo_tumor }
    assert_redirected_to tumor_path(assigns(:tumor))
  end

  test "should destroy tumor" do
    assert_difference('Tumor.count', -1) do
      delete :destroy, id: @tumor
    end

    assert_redirected_to tumors_path
  end
end

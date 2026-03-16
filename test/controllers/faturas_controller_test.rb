require "test_helper"

class FaturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fatura = faturas(:one)
  end

  test "should get index" do
    get faturas_url, as: :json
    assert_response :success
  end

  test "should create fatura" do
    assert_difference("Fatura.count") do
      post faturas_url, params: { fatura: { matricula_id: @fatura.matricula_id, status: @fatura.status, valor_fatura: @fatura.valor_fatura, vencimento: @fatura.vencimento } }, as: :json
    end

    assert_response :created
  end

  test "should show fatura" do
    get fatura_url(@fatura), as: :json
    assert_response :success
  end

  test "should update fatura" do
    patch fatura_url(@fatura), params: { fatura: { matricula_id: @fatura.matricula_id, status: @fatura.status, valor_fatura: @fatura.valor_fatura, vencimento: @fatura.vencimento } }, as: :json
    assert_response :success
  end

  test "should destroy fatura" do
    assert_difference("Fatura.count", -1) do
      delete fatura_url(@fatura), as: :json
    end

    assert_response :no_content
  end
end

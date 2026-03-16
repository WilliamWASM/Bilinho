require "test_helper"

class MatriculasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matricula = matriculas(:one)
  end

  test "should get index" do
    get matriculas_url, as: :json
    assert_response :success
  end

  test "should create matricula" do
    assert_difference("Matricula.count") do
      post matriculas_url, params: { matricula: { aluno_id: @matricula.aluno_id, dia_vencimento: @matricula.dia_vencimento, institution_id: @matricula.institution_id, nome_curso: @matricula.nome_curso, qtd_faturas: @matricula.qtd_faturas, valor_total: @matricula.valor_total } }, as: :json
    end

    assert_response :created
  end

  test "should show matricula" do
    get matricula_url(@matricula), as: :json
    assert_response :success
  end

  test "should update matricula" do
    patch matricula_url(@matricula), params: { matricula: { aluno_id: @matricula.aluno_id, dia_vencimento: @matricula.dia_vencimento, institution_id: @matricula.institution_id, nome_curso: @matricula.nome_curso, qtd_faturas: @matricula.qtd_faturas, valor_total: @matricula.valor_total } }, as: :json
    assert_response :success
  end

  test "should destroy matricula" do
    assert_difference("Matricula.count", -1) do
      delete matricula_url(@matricula), as: :json
    end

    assert_response :no_content
  end
end

require "test_helper"

class AlunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aluno = alunos(:one)
  end

  test "should get index" do
    get alunos_url, as: :json
    assert_response :success
  end

  test "should create aluno" do
    assert_difference("Aluno.count") do
      post alunos_url, params: { aluno: { cpf: @aluno.cpf, data_nascimento: @aluno.data_nascimento, email: @aluno.email, gender: @aluno.gender, name: @aluno.name, payment_method: @aluno.payment_method, telefone: @aluno.telefone } }, as: :json
    end

    assert_response :created
  end

  test "should show aluno" do
    get aluno_url(@aluno), as: :json
    assert_response :success
  end

  test "should update aluno" do
    patch aluno_url(@aluno), params: { aluno: { cpf: @aluno.cpf, data_nascimento: @aluno.data_nascimento, email: @aluno.email, gender: @aluno.gender, name: @aluno.name, payment_method: @aluno.payment_method, telefone: @aluno.telefone } }, as: :json
    assert_response :success
  end

  test "should destroy aluno" do
    assert_difference("Aluno.count", -1) do
      delete aluno_url(@aluno), as: :json
    end

    assert_response :no_content
  end
end

defmodule BD.Test do
  # use ExUnit.Case
  use Cinema.ModelCase

  @user_params %{
    "cpf" => "12345678921",
    "endereco" => "jklçkjasdf",
    "nome" => "Wesley",
    "rg" => "4545789",
    "senha" => "123456",
    "senha_confirm" => "123456",
    "telefone" => "465789456",
    "username" => "wery43"
  }

  test "unique index" do
    assert {:ok, _} = Cinema.DB.insert_in_db(@user_params)
    assert {:error, _} = Cinema.DB.insert_in_db(@user_params)
  end
end
Space
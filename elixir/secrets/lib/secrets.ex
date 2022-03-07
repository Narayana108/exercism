defmodule Secrets do
  def secret_add(secret), do: fn addition -> addition + secret end

  def secret_subtract(secret), do: fn subtraction -> subtraction - secret end

  def secret_multiply(secret), do: fn multiplication -> multiplication * secret end

  def secret_divide(secret), do: fn division -> trunc(division / secret) end

  def secret_and(secret), do: fn and_operator -> Bitwise.band(and_operator, secret) end

  def secret_xor(secret), do: fn xor_operator -> Bitwise.bxor(xor_operator, secret) end

  def secret_combine(secret_function1, secret_function2) do
    fn value ->
      value
      |> secret_function1.()
      |> secret_function2.()
    end
  end
end

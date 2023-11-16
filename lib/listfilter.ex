defmodule Listfilter do
  @moduledoc """
  A List with the integers of 1 to max should filter out the integers that are:
  1. even
  2. uneven
  3. prime numbers

  in a list
  """
  @doc """
  give back list with integer elements 1-50
  """
  @spec generate_list(integer()) :: list()
  def generate_list(max) do
    Enum.to_list(1..max)
  end

  @doc """
  give back even integers from list
  """
  @spec even_numbers_in(list()) :: list()
  def even_numbers_in(list) do
    Enum.filter(list, fn x -> rem(x, 2) == 0 end)
  end

  @doc """
  give back uneven integers from list
  """
  @spec uneven_numbers_in(list()) :: list()
  def uneven_numbers_in(list) do
    Enum.filter(list, fn x -> rem(x, 2) == 1 end)
  end

  @doc """
  prime number calc from https://gist.github.com/thebugcatcher/2487b9ed7f70ed39aa4afec86c730665
  """
  def get_primes(n) when n < 2, do: []
  def get_primes(n), do: Enum.filter(2..n, &is_prime?(&1))

  defp is_prime?(n) when n in [2, 3], do: true

  defp is_prime?(x) do
    start_lim = div(x, 2)

    Enum.reduce(2..start_lim, {true, start_lim}, fn fac, {is_prime, upper_limit} ->
      cond do
        !is_prime ->
          {false, fac}

        fac > upper_limit ->
          {is_prime, upper_limit}

        true ->
          is_prime = rem(x, fac) != 0
          upper_limit = if is_prime, do: div(x, fac + 1), else: fac
          {is_prime, upper_limit}
      end
    end)
    |> elem(0)
  end

  @doc """
    give back uneven integers from list
  """
  @spec prime_numbers_in(list()) :: list()
  def prime_numbers_in(list) do
    get_primes(List.last(list))
  end
end

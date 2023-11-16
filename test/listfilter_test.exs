defmodule ListfilterTest do
  use ExUnit.Case
  doctest Listfilter

  test "give list" do
    assert Listfilter.generate_list(5) == [1, 2, 3, 4, 5]
  end

  test "even numbers" do
    assert Listfilter.even_numbers_in(Enum.to_list(1..10)) == [2, 4, 6, 8, 10]
  end

  test "uneven numbers" do
    assert Listfilter.uneven_numbers_in(Enum.to_list(1..10)) == [1, 3, 5, 7, 9]
  end

  test "prime numbers" do
    assert Listfilter.prime_numbers_in(Enum.to_list(1..20)) == [2, 3, 5, 7, 11, 13, 17, 19]
  end
end

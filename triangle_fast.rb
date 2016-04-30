require 'minitest/autorun'
require 'benchmark'

# This was not the speedup I had hoped for. Most of the improvement comes from taking advantage of the symmetry to halve the work
def pascal(n)
  return [1] if n == 0
  row = []
  k=0
  until(k > n/2) do
    result = element(n,k)
    row[k] = result
    #rows are symetrical so complete the corresponsing element
    row[n-k] = result
    k = k + 1
  end
  return row
end

#using the identity from https://en.wikipedia.org/wiki/Pascal's_triangle#Calculating_a_row_or_diagonal_by_itself
def element(n,k)
  return 1 if k == 0 or k==n
  previous_element = element(n,k-1)
  return  previous_element * (n+1-k)/k #recursion again, which is probably why it's no faster. You've still got n method calls.
end


class TestPascal < Minitest::Test
  def test_pascal
    assert_equal [1], pascal(0)
    assert_equal [1,1], pascal(1)
    assert_equal [1,2,1], pascal(2)
    assert_equal [1,3,3,1], pascal(3)
    assert_equal [1, 10, 45, 120, 210, 252, 210, 120, 45, 10, 1], pascal(10)
    puts ''
    puts Benchmark.measure { pascal(1000) }
  end
end
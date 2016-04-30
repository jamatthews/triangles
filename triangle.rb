require 'minitest/autorun'
require 'benchmark'

def pascal(n)
  return [1] if n == 0
  previous_row = pascal(n-1) #recursion, probably slow
  next_row = [0] + previous_row + [0] #like the video. it also avoids dealing with nils
  return next_row.each_cons(2).map{|a, b| a + b }
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
# https://practice.geeksforgeeks.org/problems/k-largest-elements/0
# Given an array of N positive integers, print k largest elements from the array.
# The output elements should be printed in decreasing order.

# Input:
# The first line of input contains an integer T denoting the number of test cases. The first line of each test case is 
# N and k, N is the size of array and K is the largest elements to be returned. The second line of each test case 
# contains N input C[i].

# Output:
# Print the k largest element in descending order.

require 'test/unit'
require 'pry'
extend Test::Unit::Assertions

def largest_k_elements(filename)
  file = File.open(filename, 'r')

  test_cases = file.gets.to_i

  solutions = []
  i = 0
  while i < test_cases
    i += 1
    len, k = file.gets.split(' ').map(&:to_i)
    eles = file.gets.split(' ').map(&:to_i)
    max_elem = Array.new(k)

    eles.each_with_index do |ele, idx|
      if idx < k
        max_elem[idx] = ele
        next
      end
      max_elem.sort!.reverse! if idx == k
      next if ele < max_elem[k - 1]

      j = 0
      switch = nil
      while j < k
        if switch.nil?
          if max_elem[j] < ele
            switch = max_elem[j]
            max_elem[j] = ele
          end
        else
          temp = max_elem[j]
          max_elem[j] = switch
          switch = temp
        end
        j += 1
      end
    end
    solutions << max_elem
  end
  solutions
end

test_cases = {
  inputFile1: [[787, 23], [50, 30, 23]]
}

test_cases.each do |k, v|
  assert_equal(v, largest_k_elements("#{k}.txt"))
end

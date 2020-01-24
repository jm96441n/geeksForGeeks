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

def largest_k_elements(arr, len, k)
  max_elem = Array.new(k)

  arr.each do |ele|
    j = 0
    switch = nil
    while j < k
      break if max_elem[k - 1] && max_elem[k - 1] > ele

      if max_elem[j].nil?
        max_elem[j] = ele
        break
      elsif switch.nil? && max_elem[j] < ele
        switch = max_elem[j]
        max_elem[j] = ele
      elsif switch
        temp = max_elem[j]
        max_elem[j] = switch
        switch = temp
      end
      j += 1
    end
  end
  max_elem
end

test_cases = {
  '787 23' => [[12, 5, 787, 1, 23], 5, 2],
  '50 30 23' => [[1, 23, 12, 9, 30, 2, 50], 7, 3]
}

test_cases.each do |k, v|
  assert_equal(k.split(' ').map(&:to_i), largest_k_elements(*v))
end

=begin
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
=end

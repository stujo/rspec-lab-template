require_relative 'lib/bigo_examples'
require_relative 'lib/bigo_helper'


require 'benchmark'
include Benchmark          # we need the CAPTION and FORMAT constants


large_sorted_numbers = big_O_sorted_numbers 1000, 99
large_unsorted_numbers = big_O_unsorted_numbers 1000, 99
large_unsorted_numbers_with_duplicates = large_unsorted_numbers.clone
large_unsorted_numbers_with_duplicates[large_unsorted_numbers_with_duplicates.length - 1] = large_unsorted_numbers_with_duplicates[0]

small_sorted_numbers = big_O_sorted_numbers 10, 4
small_unsorted_numbers = big_O_unsorted_numbers 10, 4
small_unsorted_numbers_with_duplicates = small_unsorted_numbers.clone
small_unsorted_numbers_with_duplicates[small_unsorted_numbers_with_duplicates.length - 1] = small_unsorted_numbers_with_duplicates[0]
require "benchmark"

puts
puts 'big_O_1'
print "Should be a number:"
p big_O_1_first_item(large_unsorted_numbers)
puts

puts 'big_O_N - Linear Search through array'
print "Should find number:"
p big_O_N_linear_search(large_unsorted_numbers, 50)
puts

print "Should not find number:"
p big_O_N_linear_search(large_unsorted_numbers, 99)
puts

puts 'big_O_N_squared - Search for Duplicates'

print "Should Not Find Duplicates:"
p big_O_N_squared_duplicates(large_unsorted_numbers)
print "Should Find Duplicates:"
p big_O_N_squared_duplicates(large_unsorted_numbers_with_duplicates)
puts


puts 'big_O_log_N - Binary Search through array'
print "Should find number:"
p big_O_log_N_binary_search(large_sorted_numbers, 50)
print "Should not find number:"
p big_O_log_N_binary_search(large_sorted_numbers, 99)
puts

puts "big_O_N_log_N - Merge Sort"
print "Should be sorted:"
p big_O_N_log_N_merge_sort(large_unsorted_numbers) == large_sorted_numbers

puts "=" * 80
puts "Benchmarking"
puts "=" * 80

test_data = (1..25).map do
  big_O_unsorted_numbers 3000
end

small_test_data = (1..2000).map do
  big_O_unsorted_numbers 30
end

Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
  x.report("mergesort(small)") { small_test_data.each { |data| big_O_N_log_N_merge_sort(data) } }
  x.report("bubblesort(small)") { small_test_data.each { |data| big_O_N_squared_bubble_sort(data) } }
  x.report("mergesort(large)") { test_data.each { |data| big_O_N_log_N_merge_sort(data) } }
  x.report("bubblesort(large)") { test_data.each { |data| big_O_N_squared_bubble_sort(data) } }
end

puts "=" * 80

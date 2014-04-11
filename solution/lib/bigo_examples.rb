# Looking for info on Big O ?
# Check out WikiPedia:
# http://en.wikipedia.org/wiki/Big_O_notation

# And then, take a breath

# Then, check out Rob Bell's excellent article :
# http://rob-bell.net/2009/06/a-beginners-guide-to-big-o-notation/

# These examples are adapted from Rob's examples

# Other good docs here:
# http://www.cprogramming.com/tutorial/computersciencetheory/algorithmicefficiency3.html
# https://fiftyexamples.readthedocs.org/en/latest/algorithms.html

#  O(1)
#  A O(1) Algorithm will always execute in the same time (or space)
# regardless of the size of the input data set.


# First Item in Array
def big_O_1_first_item(numbers)
  # Same operation regardless of size of numbers
  numbers[0]
end

# Linear Search for number
def big_O_N_linear_search(unsorted_numbers, number)

  unsorted_numbers.each do |n|
    # Return True if n is our number
    return true if n == number
  end

  # Return False as we didnt' find number
  false
end

# Search for duplicates of any number
def big_O_N_squared_duplicates(unsorted_numbers)

  unsorted_numbers.each.with_index do |x, iX|
    unsorted_numbers.each.with_index do |y, iY|
      # Don't check the same indexes against each other
      unless iX == iY
        if x == y
          # Return True we found a match
          return true
        end
      end
    end
  end
  # No Matches
  false
end




#Binary Search
def big_O_log_N_binary_search(sorted_numbers, number)

  # Internal function to hide recursion parameters from outside world :)

  def binary_search (sorted_haystack, needle, lowerBound,  upperBound)

    #debug = sorted_haystack.slice(lowerBound..upperBound)

    if lowerBound <= upperBound
       # An actual use for integer arithmetic
      middleIndex = (lowerBound + upperBound) / 2

      middle_value = sorted_haystack[middleIndex]

      if needle == middle_value
        # We have found our needle!
        true
      else
         if needle > middle_value
           # Need to Look in the next higher block
           lowerBound = middleIndex + 1
         else
           # Need to Look in the next lower block
           upperBound = middleIndex - 1
         end

         # Recurse into ourselves and return the result
        binary_search sorted_haystack, needle, lowerBound, upperBound
      end
    else
      # We've run out of places to look
      false
    end
  end

  # Kick off the recursive search and return the result
  binary_search sorted_numbers, number, 0, sorted_numbers.length - 1
end


def big_O_N_squared_bubble_sort(unsorted_numbers)

  def sort_array numbers
    #bubble sorting
    (numbers.length - 1).times do |iteration|
      (numbers.length - 1).times do |idx|
        swap_items_in_array(numbers, idx, idx + 1) if numbers[idx] > numbers[idx + 1]
      end
    end
    numbers
  end

  def swap_items_in_array items, indexA, indexB
    tempItem = items[indexA]
    items[indexA] = items[indexB]
    items[indexB] = tempItem
    items
  end

  sort_array(unsorted_numbers)
end


#Merge Sort
# Code from https://gist.github.com/aspyct/3433278
#
def big_O_N_log_N_merge_sort(unsorted_numbers)

  def merge_sort(array)
    if array.count <= 1
      # Array of length 1 or less is always sorted
      return array
    end

    # Apply "Divide & Conquer" strategy

    # 1. Divide
    mid = array.count / 2
    part_a = merge_sort array.slice(0, mid)
    part_b = merge_sort array.slice(mid, array.count - mid)

    # 2. Conquer
    array = []
    offset_a = 0
    offset_b = 0
    while offset_a < part_a.count && offset_b < part_b.count
      a = part_a[offset_a]
      b = part_b[offset_b]

      # Take the smallest of the two, and push it on our array
      if a <= b
        array << a
        offset_a += 1
      else
        array << b
        offset_b += 1
      end
    end

    # There is at least one element left in either part_a or part_b (not both)
    while offset_a < part_a.count
      array << part_a[offset_a]
      offset_a += 1
    end

    while offset_b < part_b.count
      array << part_b[offset_b]
      offset_b += 1
    end

    return array
  end

  merge_sort unsorted_numbers
end


def big_O_2_power_N_not_sure_yet(unsorted_numbers)
#TODO
end


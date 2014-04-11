
################## HELPERS #########################

def big_O_sorted_numbers size,  min = 0, exclude = nil
  numbers = (min..(size + min) ).to_a

  numbers.delete_at(exclude - 1) unless exclude.nil?

  numbers
end


def big_O_unsorted_numbers size, min = 0, exclude = nil
  big_O_sorted_numbers(size, min, exclude).shuffle!
end



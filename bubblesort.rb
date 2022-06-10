# frozen_string_literal: true

def bubble_sort(array)
  (array.length - 1).times do
    (0...(array.length - 1)).each do |i|
      array[i] > array[i + 1] ? (array[i], array[i + 1] = array[i + 1], array[i]) : next
    end
  end
  p array
end
bubble_sort([4, 3, 78, 2, 0, 2])

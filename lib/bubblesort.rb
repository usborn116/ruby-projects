# frozen_string_literal: true
class Bubble

  def bubble_sort(arr)
    until arr == arr.sort
      arr[0...-1].each_with_index do |_n, i|
        arr[i] > arr[i + 1] ? (arr[i], arr[i + 1] = arr[i + 1], arr[i]) : next
      end
    end
    p arr
  end

end

Bubble.new.bubble_sort([4, 3, 78, 2, 0, 2])

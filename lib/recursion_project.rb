# frozen-string-literal: true

module Fibonacci
  def self.fibs(num)
    result = [0, 1]
    n1 = 0
    n2 = 1
    while num > 2
      n3 = n1 + n2
      result.push(n3)
      n1, n2 = n2, n3
      num -= 1
    end
  end

  def self.fibs_rec(num)
    return [0,1].slice(0,num) if num == 2 || num == 1
    fibs_rec(num-1) << fibs_rec(num-1)[-1] + fibs_rec(num-1)[-2]
  end

end

module MergeSort

  def self.merge_sort(array)
    return array if array.length < 2
    leftarr = array.take((array.length/2).round)
    rightarr = array.drop((array.length/2).round)
    leftsorted = merge_sort(leftarr)
    rightsorted = merge_sort(rightarr)
    merge(leftsorted, rightsorted)
  end

  def self.merge(left, right)
    return right if left.empty?
    return left if right.empty?
    right[0] < left[0] ? smallest = right.shift : smallest = left.shift
    newval = merge(left, right)
    [smallest]+newval
  end

end

p Fibonacci.fibs_rec(4)

p MergeSort.merge_sort([1,0,6,9,3,2])

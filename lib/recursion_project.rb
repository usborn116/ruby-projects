# frozen-string-literal: true

def fibs(num)
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

def fibs_rec(n)
  return [0] if n == 1
  return [0,1] if n == 2
  array = fibs_rec(n-1)
  array << array[-1] + array[-2]
end

def merge_sort(array)
  return array if array.length <= 1
  leftarr = array.take((array.length/2).round)
  rightarr = array.drop((array.length/2).round)
  leftsorted = merge_sort(leftarr)
  rightsorted = merge_sort(rightarr)
  merge(leftsorted, rightsorted)
end

def merge(left, right)
  return right if left.empty?
  return left if right.empty?
  right[0] < left[0] ? smallest = right.shift : smallest = left.shift
  newval = merge(left, right)
  [smallest]+newval
end

p merge_sort([1,0,6,9,3,2])

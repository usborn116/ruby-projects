def fibs(n)
  result = [0,1]
  n1 = 0
  n2 = 1
  while n > 2 do
    n3 = n1 + n2
    result.push(n3)
    n1, n2 = n2, n3
    n -= 1
  end
  p result
end

def fibs_rec(n)
  return [0] if n == 1
  return [0,1] if n == 2
  array = fibs_rec(n-1)
  array << array[-1] + array[-2]
end

def merge_sort(array)
  if array.length <= 1
    return array
  end
    l = (array.length/2).round
    leftarr = array.take(l)
    rightarr = array.drop(l)
    leftsorted = merge_sort(leftarr)
    rightsorted = merge_sort(rightarr)

    merge(leftsorted, rightsorted)
end

def merge(left, right)
  return right if left.empty?
  return left if right.empty?
  if right[0] < left[0]
    smallest = right.shift
  else
    smallest = left.shift
  end

  newval = merge(left, right)

  [smallest]+newval
end

p merge_sort([1,0,6,9,3,2])
  
    
  
def bubble_sort(array)
    unsorted = true
    count = array.length - 1
    while unsorted do
        for i in 0...(array.length - 1)
            if array[i] > array[i+1]
                array[i], array[i+1] = array[i+1], array[i]
            end
        end
        count -= 1
        if count == 0
            unsorted = false
        end
    end
    array
end
bubble_sort([4,3,78,2,0,2])

class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        // 1845 ms
        var nums = nums
        quicksort(&nums, 0, nums.count - 1)
        return nums
        
        // 1196 ms
        // nums.sorted()
        
        // Runtime Error - how to deal with negative numbers?
        // radixSort(nums)
    }
    
    private func radixSort(_ arr: [Int]) -> [Int] {
        let base = 10
        var done = false
        var digits = 1
        
        var result = arr
        
        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)
            result.forEach { number in
                let remaining = number / digits
                let digit = remaining % base
                buckets[digit].append(number)
                     
                if remaining > 0 {
                    done = false
                }
            }
            
            digits *= base
            result = buckets.flatMap { $0 }
        }
        
        return result
    }
    
    private func quicksort(_ nums: inout [Int], _ lo: Int, _ hi: Int) {
        if lo < hi {
            let p = partition(&nums, lo, hi)
            
            quicksort(&nums, lo, p)
            quicksort(&nums, p + 1, hi)
        }
    }

    private func partition(_ nums: inout [Int], _ lo: Int, _ hi: Int) -> Int {
        let pivot = nums[lo]
        var i = lo - 1
        var j = hi + 1

         while true {
            repeat { j -= 1 } while nums[j] > pivot
            repeat { i += 1 } while nums[i] < pivot
            
            if i < j {
                nums.swapAt(i, j)
            } else {
                return j
            }
        }
    }
}

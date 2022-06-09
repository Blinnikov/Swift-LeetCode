class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        for i in 0..<numbers.count-1 {
            let complement = binarySearch(numbers, target-numbers[i], i+1, numbers.count-1)
            if numbers[i] + numbers[complement] == target {
                return [i+1, complement+1]
            }
        }
        
        return [-1, -1] // must never happen
    }
    
    private func binarySearch(_ numbers: [Int], _ target: Int, _ lo: Int, _ hi: Int) -> Int {
        var lo = lo, hi = hi
        while lo < hi {
            let mid = lo + (hi-lo)/2
            if numbers[mid] == target {
                return mid
            }
            if numbers[mid] > target {
                hi = mid-1
            } else {
                lo = mid+1
            }
        }
        
        return lo
    }
}

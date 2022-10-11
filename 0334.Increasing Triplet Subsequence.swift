class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var first = Int.max
        var second = Int.max
        
        for num in nums {
            if num < first {
                first = num
            } else if num > first && num < second {
                second = num
            } else if num > first && num > second {
                return true
            }
        }
        
        return false
    }
}

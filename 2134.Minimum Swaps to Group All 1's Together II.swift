class Solution {
    func minSwaps(_ nums: [Int]) -> Int {
        let ones = nums.reduce(0, +)

        if ones == nums.count {
            return 0
        }
        
        let double = nums + nums

        var res = Int.max

        var onesInWindow = double[0..<(ones)].reduce(0, +)

        for i in 1..<double.count - ones {
            onesInWindow -= double[i - 1]
            onesInWindow += double[i + ones - 1]
            
            res = min(res, ones - onesInWindow)
        }

        return res
    }
}

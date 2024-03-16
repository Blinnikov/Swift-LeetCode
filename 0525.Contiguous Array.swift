class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        var map = [Int:Int]()
        var sum = 0
        var res = 0

        for i in 0..<nums.count {
            sum += (nums[i] == 1 ? 1 : -1)

            if sum == 0 {
                res = i + 1
            } else if let prevIdx = map[sum] {
                res = max(res, i - prevIdx)
            } else {
                map[sum] = i
            }
        }

        return res
    }
}

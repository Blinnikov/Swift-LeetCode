class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        var res = Array(repeating: Character("0"), count: nums[0].count)

        for i in 0..<nums.count {
            if nums[i][nums[i].index(nums[i].startIndex, offsetBy: i)] == "0" {
                res[i] = "1"
            }
        }

        return String(res)
    }
}

class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        var strs = Array(repeating: "", count: nums.count)

        for i in 0..<nums.count {
            strs[i] = "\(nums[i])"
        }

        strs.sort {
            "\($1)\($0)" < "\($0)\($1)"
        }

        if strs[0] == "0" {
            return "0"
        }

        return strs.reduce("", +)
    }
}

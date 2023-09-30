class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        if nums.count < 3 {
            return false
        }

        var kVal = Int.min
        var stack = [Int]()

        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            if nums[i] < kVal {
                return true
            } else {
                while !stack.isEmpty, nums[i] > stack.last! {
                    kVal = stack.removeLast()
                }
            }

            stack.append(nums[i])
        }

        return false
    }
}

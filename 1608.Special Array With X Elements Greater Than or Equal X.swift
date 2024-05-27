class Solution {
    func specialArray(_ nums: [Int]) -> Int {
        let nums = nums.sorted()

        if nums[0] >= nums.count {
            return nums.count
        }

        for i in 1...nums.count {
            let restLen = nums.count - i - 1

            if nums[nums.count - i] >= i && nums[restLen] < i {
                return i
            }
        }

        return -1
    }
}

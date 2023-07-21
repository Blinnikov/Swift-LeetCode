class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        var numberOfLis = Array(repeating: 0, count: nums.count)
        var lengthOfLis = Array(repeating: 0, count: nums.count)

        var res = 0
        var maxLength = 0

        for i in 0..<nums.count {
            numberOfLis[i] = 1
            lengthOfLis[i] = 1

            for j in 0..<i {
                if nums[j] >= nums[i] {
                    continue
                }

                if (lengthOfLis[j] + 1) == lengthOfLis[i] {
                    numberOfLis[i] += numberOfLis[j]
                }

                if (lengthOfLis[j] + 1) > lengthOfLis[i] {
                    lengthOfLis[i] = lengthOfLis[j] + 1
                    numberOfLis[i] = numberOfLis[j]
                }
            }

            if lengthOfLis[i] == maxLength {
                res += numberOfLis[i]
            }

            if lengthOfLis[i] > maxLength {
                maxLength = lengthOfLis[i]
                res = numberOfLis[i]
            }
        }

        // print(numberOfLis)
        // print(lengthOfLis)

        return res
    }
}

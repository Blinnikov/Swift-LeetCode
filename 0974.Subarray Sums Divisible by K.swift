class Solution {

    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
    }

    // TLE 68/73
    func subarraysDivByK_OxO(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum = Array(repeating: 0, count: nums.count + 1)

        for i in 1...nums.count {
            prefixSum[i] = prefixSum[i - 1] + nums[i - 1]
        }

        var result = 0

        for i in 0..<prefixSum.count - 1 {
            for j in (i + 1)..<prefixSum.count {
                if (prefixSum[j] - prefixSum[i]) % k == 0 {
                    // print(i, j)
                    result += 1
                }
            }
        }

        return result
    }
}

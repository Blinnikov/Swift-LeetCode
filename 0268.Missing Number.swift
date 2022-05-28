class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let sumOfFirstN = n*(n+1)/2
        let currentSum = nums.reduce(0, +)
        return sumOfFirstN - currentSum
    }
}

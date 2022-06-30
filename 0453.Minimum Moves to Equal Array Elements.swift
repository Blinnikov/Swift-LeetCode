class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        let _min = nums.min()!
        return nums.reduce(0, { $0 + ($1 - _min) })
    }
}

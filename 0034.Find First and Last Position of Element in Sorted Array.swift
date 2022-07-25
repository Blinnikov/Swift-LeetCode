class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        [nums.firstIndex(of: target) ?? -1, nums.lastIndex(of: target) ?? -1]
    }
}

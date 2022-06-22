class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        nums.sorted(by: >)[k-1]
    }
}

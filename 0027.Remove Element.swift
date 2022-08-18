class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        let oldCount = nums.count
        nums.removeAll { $0 == val }
        return nums.count
    }
}

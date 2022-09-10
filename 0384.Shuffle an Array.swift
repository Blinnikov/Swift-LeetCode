
class Solution {
    
    private let original: [Int]
    private var current: [Int]

    init(_ nums: [Int]) {
        self.original = nums
        self.current = nums
    }
    
    func reset() -> [Int] {
        self.current = self.original
        return current
    }
    
    func shuffle() -> [Int] {
        self.current.shuffled()
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */

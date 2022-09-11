class Solution {
    private var nums: [Int] = []
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        self.nums = nums
        var result = [[Int]]()
        
        for i in 0...nums.count {
            backtrack(0, i, [Int](), &result);
        }
        
        return result
    }
    
    private func backtrack(_ start: Int, _ count: Int, _ current: [Int], _ result: inout[[Int]]) {
        if current.count == count {
            result.append(current)
            return
        }
        
        for i in start..<nums.count {
            backtrack(i+1, count, current + [nums[i]], &result)
        }
    }
}

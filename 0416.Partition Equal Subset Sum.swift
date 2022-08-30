class Solution {
    private var nums: [Int] = []
    private var cache: [Key:Bool] = [:]
    
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        if sum % 2 != 0 {
            return false
        }
        
        self.nums = nums
        
        return recurse(0, 0, sum)
    }
    
    private func recurse(_ idx: Int, _ acc: Int, _ sum: Int) -> Bool {
        let key = Key(idx,acc)
        if let calculated = cache[key] {
            return calculated
        }
        
        if sum / 2 == acc {
            return true
        }
        
        if acc > sum / 2 || idx > nums.count - 1 {
            return false
        }
        
        let res = recurse(idx + 1, acc, sum) || recurse(idx + 1, acc + nums[idx], sum)
        cache[key] = res
        return res
    }
    
    private struct Key: Hashable {
        let idx: Int
        let acc: Int
        
        init(_ idx: Int, _ acc: Int) {
            self.idx = idx
            self.acc = acc
        }
    }
}

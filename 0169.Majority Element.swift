class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var candidate = 0
        var sum = 0
        for n in nums {
            if sum == 0 {
                candidate = n
                sum = 1
            } else {
                sum += candidate == n ? 1: -1
            }
        }
        
        return candidate
    }
    
    private func mapSolution(_ nums: [Int]) -> Int {
        let target = nums.count/2
        var map = [Int:Int]()
        
        for n in nums {
            if let counter = map[n] {
                map[n] = counter + 1
            } else {
                map[n] = 1
            }
            
            if map[n]! > target {
                return n
            }
        }
        
        return -1
    }
}

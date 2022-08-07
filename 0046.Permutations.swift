class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        let n = nums.count
        let sub = Array(repeating: 0, count: n)
        var result = [[Int]]()
        
        cycle(0, n, nums, sub, &result)
        
        return result
    }
    
    private func cycle(_ step: Int, _ n: Int, _ candidates: [Int], _ sub: [Int], _ result: inout [[Int]]) {
        if step == n-1 {
            for c in candidates {
                var s = sub
                s[step] = c
                result.append(s)
            }
            return
        }
        
        for c in candidates {
            var s = sub
            s[step] = c
            var newCandidates = getCandidates(candidates, c)
            cycle(step+1, n, newCandidates, s, &result)
        }
    }
    
    private func getCandidates(_ nums: [Int], _ exclude: Int) -> [Int] {
        var nums = nums
        let idx = nums.firstIndex(of: exclude)!
        nums.remove(at: idx)
        return nums
    }
}

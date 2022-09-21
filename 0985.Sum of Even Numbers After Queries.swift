class Solution {
    func sumEvenAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var nums = nums
        let n = queries.count
        var result = Array(repeating: 0, count: n)
        
        for i in 0..<n {
            let val = queries[i][0], idx = queries[i][1]
            nums[idx] = nums[idx] + val
            
            let sum = nums.reduce(0, { acc, el in 
                                      acc + (el&1 == 1 ? 0 : el)
                                     })
            
            result[i] = sum
        }
        
        return result
    }
}

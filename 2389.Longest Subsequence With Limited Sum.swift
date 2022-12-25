class Solution {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let n = nums.count
        let m = queries.count
        var answer = Array(repeating: 0, count: m)
        var nums = nums.sorted()

        for i in 0..<m {
            var size = 0
            var q = queries[i]
            for num in nums {
                if q >= num {
                    size += 1
                    q -= num
                } else {
                    break
                }
            }
            answer[i] = size 
        }

        return answer
    }
}

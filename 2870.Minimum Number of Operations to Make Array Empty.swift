class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var map = [Int:Int]()

        for n in nums {
            map[n, default: 0] += 1
        }

        var res = 0

        for (k, v) in map {
            if v == 1 {
                return -1
            }

            res += (v / 3)

            
            if v % 3 != 0 {
                res += 1 
            }
        }

        return res
    }
}

class Solution {
    func findMatrix(_ nums: [Int]) -> [[Int]] {
        var used = nums.count
        var map = [Int:Int]()

        for num in nums {
            map[num, default: 0] += 1
        }

        var res = [[Int]]()

        while used > 0 {
            var subRes = [Int]()

            for (k, v) in map {
                subRes.append(k)
                map[k] = v - 1
                if map[k] == 0 {
                    map[k] = nil
                }

                used -= 1
            }

            res.append(subRes)
        }

        return res
    }
}

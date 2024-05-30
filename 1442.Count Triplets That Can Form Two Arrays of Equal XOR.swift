class Solution {
    func countTriplets(_ arr: [Int]) -> Int {
        var res = 0

        for i in 0..<arr.count {
            for j in (i + 1)..<arr.count {
                var a = 0
                for idx in i..<j {
                    a ^= arr[idx]
                }

                var b = 0
                for idx in j..<arr.count {
                    b ^= arr[idx]

                    if a == b {
                        res += 1
                    }

                }
            }
        }

        return res
    }
}

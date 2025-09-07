class Solution {
    func sumZero(_ n: Int) -> [Int] {
        var res = Array(repeating: 0, count: n)

        if n == 1 {
            return res
        }

        var count = 0

        for i in 1...(n / 2) {
            res[count] = i
            count += 1

            res[count] = -i
            count += 1
        }

        return res
    }
}

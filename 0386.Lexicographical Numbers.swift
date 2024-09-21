class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        var res = [Int]()
        res.reserveCapacity(n)

        var num = 1

        for i in 0..<n {
            res.append(num)

            if num * 10 <= n {
                num *= 10
            } else {
                while num % 10 == 9 || num >= n {
                    num /= 10
                }

                num += 1
            }
        }

        return res
    }
}

class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var res = [Int]()

        for i in 1...9 {
            var subRes = i
            var next = i + 1

            while subRes <= high, next <= 9 {
                subRes = subRes * 10 + next

                if subRes >= low, subRes <= high {
                    res.append(subRes)
                }

                next += 1
            }
        }

        return res.sorted()
    }
}

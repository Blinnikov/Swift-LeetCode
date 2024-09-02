class Solution {
    func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
        var i = 0
        var k = k

        var sum = chalk.reduce(0, +)
        k = k % sum

        while k > 0 {
            i = i % chalk.count
            k -= chalk[i]

            if k < 0 {
                return i
            }

            i += 1

            if k == 0 {
                return i % chalk.count
            }
        }

        return i % chalk.count
    }
}

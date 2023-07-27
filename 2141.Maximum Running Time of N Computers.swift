class Solution {
    func maxRunTime(_ n: Int, _ batteries: [Int]) -> Int {
        let b = batteries.sorted()
        var s = batteries.reduce(0, +)

        var i = 0

        while b[b.count - 1 - i] > (s / (n - i)) {
            s -= b[b.count - 1 - i]
            i += 1
        }

        return s / (n - i)
    }
}

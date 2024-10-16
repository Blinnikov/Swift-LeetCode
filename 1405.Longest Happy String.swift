class Solution {
    private let _a = 0
    private let _b = 1
    private let _c = 2

    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var a = a
        var b = b
        var c = c
        let n = a + b + c

        var count = Array(repeating: 0, count: 3)
        var chars = [Character]()
        chars.reserveCapacity(n)

        for _ in 0..<n {
            if (a >= b && a >= c && count[_a] != 2) || (a > 0 && (count[_b] == 2 || count[_c] == 2)) {
                chars.append("a")

                a -= 1

                count[_a] += 1
                count[_b] = 0
                count[_c] = 0
            } else if (b >= a && b >= c && count[_b] != 2) || (b > 0 && (count[_a] == 2 || count[_c] == 2)) {
                chars.append("b")

                b -= 1

                count[_a] = 0
                count[_b] += 1
                count[_c] = 0
            } else if (c >= a && c >= b && count[_c] != 2) || (c > 0 && (count[_a] == 2 || count[_b] == 2)) {
                chars.append("c")

                c -= 1

                count[_a] = 0
                count[_b] = 0
                count[_c] += 1
            }
        }

        return String(chars)
    }
}

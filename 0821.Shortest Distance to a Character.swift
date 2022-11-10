class Solution {
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        var chars = Array(s)
        var prev = Int.min / 2

        var answer = Array(repeating: 0, count: chars.count)

        for i in 0..<chars.count {
            if chars[i] == c {
                prev = i
            }

            answer[i] = i - prev
        }

        prev = Int.max / 2
        for i in stride(from: chars.count - 1, through: 0, by: -1) {
            if chars[i] == c {
                prev = i
            }

            answer[i] = min(answer[i], prev - i)
        }

        return answer
    }
}

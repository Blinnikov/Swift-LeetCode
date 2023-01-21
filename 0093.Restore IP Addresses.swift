class Solution {
    var result = [String]()

    func restoreIpAddresses(_ s: String) -> [String] {
        var dots = [Int]()
        backtrack(Array(s), 0, &dots);
        return result
    }

    private func backtrack(_ chars: [Character], _ start: Int, _ dots: inout [Int]) {
        let remaining = chars.count - start
        let remainingSegments = 4 - dots.count

        if remaining > remainingSegments * 3 || remaining < remainingSegments {
            return
        }

        if dots.count == 3 {
            if valid(chars, start, remaining) {
                var last = 0
                var candidate = [Character]()
                for dot in dots {
                    candidate += chars[last..<last + dot]
                    last += dot
                    candidate.append(".")
                }
                candidate += chars[start...]
                result.append(String(candidate))
            }

            return
        }

        var position = 1
        while position <= 3, position <= remaining {
            dots.append(position)
            
            if valid(chars, start, position) {
                backtrack(chars, start + position, &dots)
            }

            dots.removeLast()
            position += 1
        }
    }

    private func valid(_ chars: [Character], _ start: Int, _ count: Int) -> Bool {
        return count == 1 ||
            (chars[start] != "0" && (count < 3 || String(chars[start..<start + count]) <= "255"))
    }
}

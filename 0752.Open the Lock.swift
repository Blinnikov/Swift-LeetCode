class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let start = "0000"
        let deadends = Set(deadends)

        if deadends.contains(start) {
            return -1
        }

        var queue = [(String, Int)]()
        var visited = Set<String>()

        queue.append((start, 0))
        visited.insert(start)

        while !queue.isEmpty {
            let pair = queue.removeLast()
            let lock = pair.0
            let moves = pair.1

            if lock == target {
                return moves
            }

            for next in nextCombinations(lock) {
                if !visited.contains(next), !deadends.contains(next) {
                    visited.insert(next)
                    queue.insert((next, moves + 1), at: 0)
                }
            }
        }

        return -1
    }

    private func nextCombinations(_ lock: String) -> [String] {
        guard lock.count == 4 else {
            return []
        }

        var chars = Array(lock)

        var result = [String]()
        result.reserveCapacity(8)

        for i in 0..<chars.count {
            let currChar = chars[i]

            let n = charToDigit(chars[i])

            let newLowerDigit = (n - 1 + 10) % 10
            let newHigherDigit = (n + 1 + 10) % 10

            chars[i] = digitToChar(newLowerDigit)
            result.append(String(chars))

            chars[i] = digitToChar(newHigherDigit)
            result.append(String(chars))

            chars[i] = currChar
        }

        return result
    }

    private func charToDigit(_ char: Character) -> Int {
        return char.wholeNumberValue!
    }

    private func digitToChar(_ num: Int) -> Character {
        return Character(String(num))
    }
}

class Solution {

    private let a = Int(Character("a").asciiValue!)

    func partitionLabels(_ s: String) -> [Int] {
        var lastPositions = Array(repeating: 0, count: 26)
        let chars = Array(s)
        for i in 0..<chars.count {
            lastPositions[Int(chars[i].asciiValue!) - a] = i
        }

        var result = [Int]()
        var left = 0, right = 0
        for i in 0..<chars.count {
            let rightForCurrentChar = lastPositions[Int(chars[i].asciiValue!) - a]
            // print(rightForCurrentChar)
            right = max(right, rightForCurrentChar)
            // print(right)
            if i == right {
                result.append(right - left + 1)
                left = right + 1
            }
        }

        return result
    }
}

class Solution {
    private let a = Int(Character("a").asciiValue!)
    private var components = Array(repeating: 0, count: 26)

    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        for i in 0..<26 {
            components[i] = i
        }

        let chars1 = Array(s1)
        let chars2 = Array(s2)

        for i in 0..<chars1.count {
            union(charToInt(chars1[i]), charToInt(chars2[i]))
        }

        let baseChars = Array(baseStr)
        var result = Array(repeating: 0, count: baseChars.count)

        for i in 0..<baseChars.count {
            result[i] = find(charToInt(baseChars[i]))
        }

        var chars = [Character]()
        for i in result {
            chars.append(intToChar(i))
        }
        return String(chars)
    }

    private func find(_ i: Int) -> Int {
        if components[i] == i {
            return i
        }

        let found = find(components[i])
        components[i] = found
        return found
    }

    private func union(_ a: Int, _ b: Int) {
        let rootA = find(a)
        let rootB = find(b)

        if rootA == rootB {
            return
        }

        if rootA < rootB {
            components[rootB] = rootA
        } else {
            components[rootA] = rootB
        }
    }

    private func intToChar(_ i: Int) -> Character {
        Character(UnicodeScalar(i + a)!)
    }

    private func charToInt(_ ch: Character) -> Int {
        Int(ch.asciiValue!) - a
    }
}

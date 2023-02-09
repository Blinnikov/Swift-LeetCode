class Solution {
    func distinctNames(_ ideas: [String]) -> Int {
        var groups = Array(repeating: Set<String>(), count: 26)

        for idea in ideas {
            let chars = Array(idea)
            groups[charToInt(chars[0])].insert(String(chars[1...]))
        }

        print(groups)

        var result = 0

        for i in 0..<25 {
            for j in i+1..<26 {
                var mutual = 0
                for ideaA in groups[i] {
                    if groups[j].contains(ideaA) {
                        mutual += 1
                    }
                }

                result += 2 * (groups[i].count - mutual) * (groups[j].count - mutual)
            }
        }

        return result
    }

    private func charToInt(_ ch: Character) -> Int {
        Int(ch.asciiValue!) - 97
    }
}

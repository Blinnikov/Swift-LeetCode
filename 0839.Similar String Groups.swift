class Solution {
    private var stringsAsChars = [[Character]]()
    private var visited = [Bool]()

    func numSimilarGroups(_ strs: [String]) -> Int {
        for str in strs {
            stringsAsChars.append(Array(str))
        }

        visited = Array(repeating: false, count: stringsAsChars.count)

        var res = 0

        for i in 0..<stringsAsChars.count {
            if visited[i] {
                continue
            }

            res += 1
            traverse(i)
        }

        return res
    }

    private func traverse(_ idx: Int) {
        visited[idx] = true
        let chars = stringsAsChars[idx]

        for i in 0..<stringsAsChars.count {
            if !visited[i], similar(chars, stringsAsChars[i]) {
                traverse(i)
            }
        }
    }

    private func similar(_ chars1: [Character], _ chars2: [Character]) -> Bool {
        var count = 0

        for i in 0..<chars1.count {
            if chars1[i] != chars2[i] {
                count += 1
            }
        }

        return count == 2 || count == 0
    }
}

class Solution {
    var set = Set<String>()
    var chars = [Character]()

    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        self.set = Set(wordDict)
        self.chars = Array(s)

        return traverse(0)
    }

    private func traverse(_ idx: Int) -> [String] {
        var res = [String]()

        if idx == chars.count {
            return[""]
        }

        for i in (idx + 1)...chars.count {
            let prefixStr = String(chars[idx..<i])

            if set.contains(prefixStr) {
                let suffixes = traverse(i)

                for s in suffixes {
                    let strToAdd = "\(prefixStr)\(s == "" ? "" : " ")\(s)"
                    res.append(strToAdd)
                }
            }
        }

        return res
    }
}

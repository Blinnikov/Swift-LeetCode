class Solution {
    func vowelStrings(_ words: [String], _ queries: [[Int]]) -> [Int] {
        let set = Set<Character>(["a", "e", "i", "o", "u"])

        var sum = 0
        var ps = Array(repeating: 0, count: words.count)

        for i in 0..<words.count {
            let w = Array(words[i])

            if set.contains(w.first!), set.contains(w.last!) {
                sum += 1
            }

            ps[i] = sum
        }

        var res = Array(repeating: 0, count: queries.count)

        for i in 0..<queries.count {
            let l = queries[i][0]
            let r = queries[i][1]

            res[i] = ps[r] - (l == 0 ? 0 : ps[l - 1])
        }

        return res
    }
}

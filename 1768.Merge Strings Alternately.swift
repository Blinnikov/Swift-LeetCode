class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var chars1 = Array(word1)
        var chars2 = Array(word2)
        
        var p1 = 0
        var p2 = 0

        var n1 = chars1.count
        var n2 = chars2.count

        var result = [Character]()
        result.reserveCapacity(n1 + n2)

        while p1 < n1 || p2 < n2 {
            if p1 < n1 {
                result.append(chars1[p1])
                p1 += 1
            }

            if p2 < n2 {
                result.append(chars2[p2])
                p2 += 1
            }
        }

        return String(result)
    }
}

class Solution {
    func addSpaces(_ s: String, _ spaces: [Int]) -> String {
        var res = [Character]()
        res.reserveCapacity(s.count + spaces.count)

        var spaceIdx = 0
        var chars = Array(s)
        
        for charIdx in 0..<chars.count {
            let ch = chars[charIdx]

            if spaceIdx < spaces.count, charIdx == spaces[spaceIdx] {
                res.append(" ")
                spaceIdx += 1
            }
            
            res.append(ch)
        }

        return String(res)
    }
}

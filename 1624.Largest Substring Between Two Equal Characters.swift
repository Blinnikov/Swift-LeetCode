class Solution {
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        let chars = Array(s)
        var map = [Character:Int]()
        var res = -1

        for i in 0..<chars.count {
            let ch = chars[i]

            if map[ch] == nil {
                map[ch] = i
            } else {
                res = max(res, i - map[ch]! - 1)
            }
        }

        return res
    }
}

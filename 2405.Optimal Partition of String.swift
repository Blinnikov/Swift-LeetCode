class Solution {
    func partitionString(_ s: String) -> Int {
        var result = 1

        var chars = Array(s)
        var map = [Character:Bool]()

        for ch in chars {
            if let exist = map[ch] {
                result += 1
                map = [:]
            }

            map[ch] = true
        }

        return result
    }
}

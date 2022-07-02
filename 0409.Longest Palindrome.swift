class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var map = [Character:Int]()
        for ch in Array(s) {
            if map[ch] == nil {
                map[ch] = 1
            } else {
                map[ch] = map[ch]! + 1
            }
        }
        
        var sum = 0
        var oddUsed = false
        for v in map.values {
            if v % 2 == 0 {
                sum += v
            } else if !oddUsed {
                sum += v
                oddUsed = true
            } else {
                sum += (v-1)
            }
        }
        
        return sum
    }
}

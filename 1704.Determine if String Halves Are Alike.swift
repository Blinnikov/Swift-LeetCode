class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var a = 0
        var b = 0

        let str = Array(s)
        var i = 0
        var j = str.count - 1
        while i < j {
            a += vowels.contains(str[i]) ? 1 : 0
            b += vowels.contains(str[j]) ? 1 : 0

            i += 1
            j -= 1
        }
        
        return a == b
    }
}

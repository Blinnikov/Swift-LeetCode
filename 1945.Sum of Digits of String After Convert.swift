class Solution {
    func getLucky(_ s: String, _ k: Int) -> Int {
        var str = ""
        
        for ch in s {
            str += "\(charToInt(ch))"
        }

        var n = 0
        
        for ch in str {
            n += ch.wholeNumberValue!
        }

        if k == 1 {
            return n
        }

        var k = k - 1

        while k > 0 {
            n = sum(n)
            k -= 1
        }

        return n
    }

    private func sum(_ n: Int) -> Int {
        var n = n
        var res = 0

        while n > 0 {
            res += (n % 10)
            n /= 10
        }

        return res
    }

    private func charToInt(_ ch: Character) -> Int {
        return Int(ch.asciiValue! - Character("a").asciiValue! + 1)
    }
}

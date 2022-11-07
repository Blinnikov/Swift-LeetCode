class Solution {
    func maximum69Number (_ num: Int) -> Int {
        var chars = Array(String(num))
        // print(chars)

        var i = 0
        while i < chars.count, chars[i] != "6" {
            i += 1
        }

        if i >= chars.count {
            return num
        }

        chars[i] = "9"
        return Int(String(chars))!
    }
}

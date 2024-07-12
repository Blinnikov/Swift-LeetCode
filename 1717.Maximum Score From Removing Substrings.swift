class Solution {
    func maximumGain(_ s: String, _ x: Int, _ y: Int) -> Int {
        var res = 0
        var a = 0
        var b = 0
        
        let _min = min(x, y)
        let chars = Array(s)

        for ch in chars {
            if ch > Character("b") {
                res += min(a, b) * _min
                a = 0
                b = 0
            } else if ch == Character("a") {
                if x < y, b > 0 {
                    b -= 1
                    res += y
                } else {
                    a += 1
                }
            } else {
                if x > y, a > 0 {
                    a -= 1
                    res += x
                } else {
                    b += 1
                }
            }
        }

        res += min(a, b) * _min
        
        return res
    }
}

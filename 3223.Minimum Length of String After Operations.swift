class Solution {
    func minimumLength(_ s: String) -> Int {
        var chars = Array(s)
        var map = [Character:Int]()

        for ch in chars {
            map[ch, default: 0] += 1
        }

        var res = 0

        for kv in map {
            let left = kv.value & 1 == 1 ? 1 : 2
            res += kv.value - left
        }

        return chars.count - res
    }
}

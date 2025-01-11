class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        if s.count < k {
            return false
        }

        var map = [Character:Int]()

        for ch in s {
            map[ch, default: 0] += 1
        }

        var odd = 0

        for p in map {
            if p.value & 1 == 1 {
                odd += 1
            }
        }

        if odd > k {
            return false
        }

        return true
    }
}

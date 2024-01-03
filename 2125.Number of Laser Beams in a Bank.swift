class Solution {
    func numberOfBeams(_ bank: [String]) -> Int {
        var lasers = Array(repeating: 0, count: bank.count)

        var chars = [Character]()
        chars.reserveCapacity(bank[0].count)
        
        for i in 0..<bank.count {
            chars = Array(bank[i])

            for ch in chars {
                lasers[i] += (ch == "1" ? 1 : 0)
            }
        }

        var prev = 0
        var res = 0

        for l in lasers {
            if l == 0 {
                continue
            }

            if prev > 0 {
                res += (prev * l)
                prev = l
            } else {
                prev = l
            }
        }

        return res
    }
}

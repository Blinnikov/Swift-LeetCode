class Solution {
    private var map = [Int]()

    func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
        self.map = mapping

        let converted = nums.map(convert)

        var res = nums.enumerated().sorted {
            converted[$0.0] < converted[$1.0]
        }.map { $0.1 }

        return Array(res)
    }

    private func convert(_ n: Int) -> Int {
        if n == 0 {
            return map[n]
        }

        var n = n
        var res = 0
        var i = 0

        while n > 0 {
            let rest = n % 10
            let val = map[rest]
            
            res = res + Int(pow(Double(10), Double(i))) * val

            i += 1
            n /= 10
        }

        return res
    }
}

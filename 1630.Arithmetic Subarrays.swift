class Solution {
    private var nums = [Int]()

    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        self.nums = nums

        var res = Array(repeating: false, count: l.count)

        for i in 0..<l.count {
            res[i] = isArithmetic(l[i], r[i])
        }

        return res
    }

    private func isArithmetic(_ lo: Int, _ hi: Int) -> Bool {
        if hi - lo == 1 {
            return true
        }

        let slice = nums[lo...hi].sorted()
        let diff = slice[1] - slice[0]

        for i in 2..<slice.count {
            if slice[i] - slice[i - 1] != diff {
                return false
            }
        }

        return true
    }
}

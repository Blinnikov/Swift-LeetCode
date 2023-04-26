class Solution {
    func addDigits(_ num: Int) -> Int {
        var num = num

        while num > 9 {
            num = reduce(num)
        }

        return num
    }

    private func reduce(_ num: Int) -> Int {
        var num = num
        var res = 0

        while num > 0 {
            res += (num % 10)
            num /= 10
        }

        return res
    }
}

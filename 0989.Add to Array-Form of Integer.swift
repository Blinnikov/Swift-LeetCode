class Solution {
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        var num = num
        var kArr = [Int]()
        var kTemp = k
        while kTemp != 0 {
            kArr.append(kTemp % 10)
            kTemp /= 10
        }
        kArr.reverse()

        if kArr.count < num.count {
            kArr = Array(repeating: 0, count: num.count - kArr.count) + kArr
        } else if num.count < kArr.count {
            num = Array(repeating: 0, count: kArr.count - num.count) + num
        }

        let len = num.count
        var res = Array(repeating: 0, count: len)

        var transfer = 0
        for i in 0..<len {
            let idx = len - 1 - i
            let nVal = idx >= 0 ? num[idx] : 0
            let kVal = idx >= 0 ? kArr[idx] : 0

            var val = nVal + kVal + transfer
            if val > 9 {
                transfer = 1
                val %= 10
            } else {
                transfer = 0
            }
            res[idx] = val
        }

        if transfer == 1 {
            res.insert(1, at: 0)
        }

        return res
    }
}

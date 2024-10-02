class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        var map = [Int:Int]()
        let sorted = arr.sorted()

        var r = 1

        for i in 0..<sorted.count {
            if i > 0, sorted[i] > sorted[i - 1] {
                r += 1
            }

            map[sorted[i]] = r
        }

        var res = arr

        for i in 0..<arr.count {
            res[i] = map[arr[i]]!
        }

        return res
    }
}

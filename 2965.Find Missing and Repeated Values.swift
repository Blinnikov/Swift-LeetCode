class Solution {
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        var set = Set<Int>()
        var res = [Int]()

        for row in grid {
            for el in row {
                if set.contains(el) {
                    res.append(el)
                }

                set.insert(el)
            }
        }

        for i in 1...(grid.count * grid.count) {
            if !set.contains(i) {
                res.append(i)
            }
        }

        return res
    }
}

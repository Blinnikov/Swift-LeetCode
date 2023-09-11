class Solution {
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var res = [[Int]]()

        var map = [Int:[Int]]()

        for i in 0..<groupSizes.count {
            let groupSize = groupSizes[i]
            map[groupSize, default: [Int]()].append(i)

            if map[groupSize]!.count == groupSize {
                res.append(map[groupSize]!)
                map[groupSize] = nil
            }
        }

        return res
    }
}

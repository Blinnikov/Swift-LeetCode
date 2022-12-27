class Solution {
    func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
        var additionalRocks = additionalRocks
        var leftSpace = Array(repeating: 0, count: rocks.count)

        for i in 0..<rocks.count {
            leftSpace[i] = capacity[i] - rocks[i]
        }

        leftSpace.sort()

        var bags = 0
        for i in 0..<leftSpace.count {
            if leftSpace[i] <= additionalRocks {
                bags += 1
                additionalRocks -= leftSpace[i]
            }
        }

        return bags
    }
}

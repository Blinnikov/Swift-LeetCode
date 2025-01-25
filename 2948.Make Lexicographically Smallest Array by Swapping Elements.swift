class Solution {
    func lexicographicallySmallestArray(_ nums: [Int], _ limit: Int) -> [Int] {
        let sorted = nums.sorted()

        var group = 0
        var map = [Int:Int]()
        map[sorted[0]] = group

        var graph = [Int:[Int]]()
        graph[group, default: []].append(sorted[0])

        for i in 1..<nums.count {
            if abs(sorted[i] - sorted[i - 1]) > limit {
                group += 1
            }

            map[sorted[i]] = group

            graph[group, default: []].append(sorted[i])
        }

        var res = Array(repeating: 0, count: nums.count)

        for i in 0..<nums.count {
            let group = map[nums[i]]!
            res[i] = graph[group]!.removeFirst()
        }

        return res
    }
}

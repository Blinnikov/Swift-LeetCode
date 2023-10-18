class Solution {
    private var time = [Int]()

    func minimumTime(_ n: Int, _ relations: [[Int]], _ time: [Int]) -> Int {
        self.time = time

        var graph = Array(repeating: [Int](), count: n)

        for r in relations {
            let prev = r[0] - 1
            let next = r[1] - 1

            graph[next].append(prev)
        }

        var memo = Array(repeating: 0, count: n)

        var minTime = 0

        for c in 0..<n {
            minTime = max(minTime, getTime(c, &graph, &memo))
        }

        return minTime
    }

    func getTime(_ course: Int, _ graph: inout [[Int]], _ memo: inout [Int]) -> Int {
        if memo[course] != 0 {
            return memo[course]
        }

        var maxTime = 0
        for c in graph[course] {
            maxTime = max(maxTime, getTime(c, &graph, &memo))
        }

        memo[course] = maxTime + time[course]

        return memo[course]
    }
}

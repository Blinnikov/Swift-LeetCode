class Solution {

    private var time = [Int]()
    private var adj = [Int:[Int]]()

    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        time = informTime

        for i in 0..<manager.count {
            let idx = manager[i]
            adj[idx, default: [Int]()].append(i)
        }

        return dfs(headID)
    }

    private func dfs(_ emp: Int) -> Int {
        var result = 0

        if let reports = adj[emp] {
            for report in reports {
                result = max(result, dfs(report))
            }
            
            return time[emp] + result
        } else {
            return result
        }
    }
}

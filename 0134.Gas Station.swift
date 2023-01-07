class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let gasTotal = gas.reduce(0, +)
        let costTotal = cost.reduce(0, +)

        if gasTotal < costTotal {
            return -1
        }

        var startIdx = 0
        var gasLeft = 0

        for i in 0..<gas.count {
            gasLeft += gas[i] - cost[i]
            if gasLeft < 0 {
                startIdx = i + 1
                gasLeft = 0
            }
        }

        return startIdx
    }
}

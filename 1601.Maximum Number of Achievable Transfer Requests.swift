class Solution {
    private var requests = [[Int]]()
    private var transfers = [Int]()
    private var n = 0

    func maximumRequests(_ n: Int, _ requests: [[Int]]) -> Int {
        self.requests = requests
        self.transfers = Array(repeating: 0, count: n)
        self.n = n

        return backtrack(0, 0)
    }

    private func backtrack(_ from: Int, _ amount: Int) -> Int {
        if from == requests.count {
            if !transfers.allSatisfy { $0 == 0 } {
                return 0
            }

            return amount
        }

        let fromIdx = requests[from][0]
        let toIdx = requests[from][1]

        transfers[fromIdx] -= 1
        transfers[toIdx] += 1
        let move = backtrack(from + 1, amount + 1)

        transfers[fromIdx] += 1
        transfers[toIdx] -= 1
        let stay = backtrack(from + 1, amount)

        return max(move, stay)
    }
}

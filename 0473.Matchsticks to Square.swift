class Solution {
    private var sides = Array(repeating: 0, count: 4)
    
    func makesquare(_ matchsticks: [Int]) -> Bool {
        var sum = matchsticks.reduce(0, +)
        
        if sum % 4 != 0 {
            return false
        }
        
        let side = sum / 4
        var sticks = matchsticks.sorted { $1 < $0 }
        if sticks[0] > side {
            return false
        }
        
        return dfs(&sticks, side, 0)
    }
    
    private func dfs(_ sticks: inout [Int], _ side: Int, _ index: Int) -> Bool {
        if index == sticks.count {
            return sides[0] == sides[1] && sides[1] == sides[2] && sides[2] == sides[3]
        }
        
        for i in 0..<4 {
            if sides[i] + sticks[index] <= side {
                sides[i] += sticks[index]
                if dfs(&sticks, side, index+1) {
                    return true
                }
                sides[i] -= sticks[index]
            }
        }

        return false
        
    }
}

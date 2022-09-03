class Solution {
    func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
        var result = [Int]()
        for i in 1...9 {
            dfs(n-1, i, k, &result)
        }
        return result
    }
    
    private func dfs(_ digitsLeft: Int, _ currentNumber: Int, _ k: Int, _ result: inout [Int]) {
        if digitsLeft == 0 {
            result.append(currentNumber)
            return
        }
        
        var nextDigits = [Int]()
        let tailDigit = currentNumber % 10
        nextDigits.append(tailDigit + k)
        if k != 0 {
            nextDigits.append(tailDigit - k)
        }
        
        for next in nextDigits {
            if (next >= 0 && next <= 9) {
                let newNumber = currentNumber * 10 + next
                dfs(digitsLeft - 1, newNumber, k, &result)
            }
        }
    }
}

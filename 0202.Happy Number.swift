class Solution {
    func isHappy(_ n: Int) -> Bool {
        var alreadySeenNumbers = [Int:Bool]()
        
        var n = n
        while true {
            n = numberToSumOfSquares(n)
            print(n)
            if let seen = alreadySeenNumbers[n], seen {
                // cycle
                return false
            } else {
                alreadySeenNumbers[n] = true
            }
            
            if n == 1 {
                return true
            }
        }

        return false 
    }
    
    private func numberToSumOfSquares(_ n: Int) -> Int {
        var n = n
        var result = 0
        
        while n != 0 {
            result += (n%10)*(n%10)
            n = n/10
        }
        
        return result
    }
}

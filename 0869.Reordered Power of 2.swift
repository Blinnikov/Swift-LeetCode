class Solution {
    func reorderedPowerOf2(_ n: Int) -> Bool {
        var digits = Array(String(n)).map { $0.wholeNumberValue! }
        return permutations(&digits, 0)
    }
    
    public func permutations(_ digits: inout [Int], _ start: Int) -> Bool {
        if start == digits.count {
            return powerOfTwo(digits)
        }
        
        for i in start..<digits.count {
            digits.swapAt(start, i)
            
            if permutations(&digits, start+1) {
                return true
            }
            
            digits.swapAt(start, i)
        }

        return false
    }
    
    private func powerOfTwo(_ digits: [Int]) -> Bool {
        if digits[0] == 0 {
            return false
        }

        var num = 0
        for digit in digits {
            num = 10 * num + digit
        }
        
        while num > 0 && (num & 1) == 0 {
            num >>= 1
        }

        return num == 1
    }
}

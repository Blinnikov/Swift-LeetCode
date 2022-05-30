class Solution {
    private let twoPow31 = 2147483648
    
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let sign = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0) ? -1 : 1
        var dividend = dividend < 0 ? -dividend : dividend
        let divisor = divisor < 0 ? -divisor : divisor
        var quotient = 0
        
        for i in stride(from: 31, through: 0, by: -1) {
            if divisor << i <= dividend {
                dividend -= (divisor << i)
                quotient |= 1 << i
            }
        }
        
        if (quotient > twoPow31 - 1) && sign == 1 {
            return twoPow31 - 1
        }
        
        if (quotient > twoPow31) && sign == -1 {
            return -twoPow31
        }
        
        return sign == -1 ? -quotient : quotient
    }
}

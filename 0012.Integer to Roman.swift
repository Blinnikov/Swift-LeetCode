class Solution {
    func intToRoman(_ num: Int) -> String {
        
        let M = ["", "M", "MM", "MMM"]
        let C = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        let X = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
        let I = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        
        var num = num
        
        let thousands = M[num/1000]
        num = num % 1000
        
        let hundreds = C[num/100]
        num %= 100
        
        let tens = X[num/10]
        num %= 10
        
        let ones = I[num]
        
        return "\(thousands)\(hundreds)\(tens)\(ones)"
        
    }
}

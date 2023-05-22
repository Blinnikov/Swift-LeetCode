class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        n > 0 && 1162261467 % n == 0
        // (log10(Double(n))/log10(3.0)).truncatingRemainder(dividingBy: 1.0) == 0
        
//         if n == 0 {
//             return false
//         }
        
//         var n = n
        
//         while true {
//             if n == 1 {
//                 return true 
//             }
            
//             if (n % 3) != 0 {
//                 return false
//             }
            
//             n = n / 3
//         }
    }
}

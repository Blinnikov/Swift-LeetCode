class Solution {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        let tokens = tokens.sorted()
        // print(tokens)
        
        var lo = 0, hi = tokens.count-1
        var power = power, score = 0, result = 0
        
        while lo <= hi && (power >= tokens[lo] || score > 0) {
            while lo <= hi && power >= tokens[lo] {
                power -= tokens[lo]
                lo += 1
                score += 1
            }
            
            result = max(result, score)
            
            if lo <= hi && score > 0 {
                power += tokens[hi]
                hi -= 1
                score -= 1
            }
        }
        
        return result
    }
}

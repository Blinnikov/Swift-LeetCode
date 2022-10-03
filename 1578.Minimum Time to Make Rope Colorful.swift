class Solution {
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        var c = Array(colors)
        var result = 0, lo = 0, hi = 0
        
        while lo < neededTime.count, hi < neededTime.count {
            var colorTime = 0, maxColorTime = 0
            
            while hi < neededTime.count, c[lo] == c[hi] {
                colorTime += neededTime[hi]
                maxColorTime = max(maxColorTime, neededTime[hi])
                hi += 1
            }
            
            result += (colorTime - maxColorTime)
            lo = hi
        }
        
        return result
    }
}

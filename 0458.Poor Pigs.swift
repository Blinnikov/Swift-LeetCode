class Solution {
    func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
        var pigs = 0
        
        let T = Double(minutesToTest / minutesToDie)
        
        while Int(pow(T+1, Double(pigs))) < buckets {
            pigs += 1
        }
            
        return pigs
    }
}

class Solution {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let pairs = pairs.sorted { $0[1] < $1[1] }
        
        var res = 0
        var i = 0


        while i < pairs.count {
            res += 1
            let end = pairs[i][1]
            
            while i < pairs.count, pairs[i][0] <= end {
                i += 1
            }
        }

        return res
    }
}

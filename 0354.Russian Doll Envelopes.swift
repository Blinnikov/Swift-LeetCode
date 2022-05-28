class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        secondAttempt(envelopes)
    }
    
    private func secondAttempt(_ envelopes: [[Int]]) -> Int { 
        var envelopes = envelopes.sorted { (lhs, rhs) in
            if lhs[0] == rhs[0] {
                return lhs[1] > rhs[1]
            }
    
            return lhs[0] < rhs[0]
        }
        
        print("Sorted envelopes: \(envelopes)")
        
        var dp = Array(repeating: 0, count: envelopes.count)
        var res = 0
        
        for i in 0..<envelopes.count {
            print("Checking i=\(i)")
            let idx = binarySearch(dp, 0, res, envelopes[i][1])
            print("idx found = \(idx)")
            dp[idx] = envelopes[i][1]
            print("Current dp: \(dp)")
            
            if idx == res {
                res += 1
            }
        }
        
        return res
    }
    
    private func binarySearch(_ dp: [Int], _ s: Int, _ e: Int, _ item: Int) -> Int {
        var s = s
        var e = e
        
        while s < e {
            let mid = s + (e - s)/2
            
            if dp[mid] == item {
                return mid
            } else if dp[mid] > item {
                e = mid
            } else {
                s = mid + 1
            }
        }
        
        return s
    }
    
    private func firstAttempt(_ envelopes: [[Int]]) -> Int {
        // print("Original envelopes: \(envelopes)")
        var envelopes = envelopes.sorted { (lhs, rhs) in
            if lhs[0] == rhs[0] { // <1>
                return lhs[1] < rhs[1]
            }
    
            return lhs[0] < rhs[0]
        }
        
        // print("Sorted envelopes: \(envelopes)")
        
        var dp = Array(repeating: 1, count: envelopes.count)
        var res = 1
        for i in 1..<envelopes.count {
            // print("Checking i=\(i) - \(envelopes[i])")
            
            // find previous max sequence that fits into current envelop
            for j in 0..<i {
                if envelopes[i][0] != envelopes[j][0] && envelopes[i][1] > envelopes[j][1] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            
            // print("Current dp is \(dp)")
            
            res = max(dp[i], res)
        }
        // print(dp)
        // print("Max is :\(res1)")
        
        return res
    }
}

class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s1.count + s2.count != s3.count {
            return false
        }
        
        if s1 == "" && s2 == "" && s3 == "" {
            return true
        }
        
        let s1Arr = Array(s1)
        let s2Arr = Array(s2)
        let s3Arr = Array(s3)
        
        
        return check(s1Arr, 0, s2Arr, 0, s3Arr, 0)
    }
    
    private func check(_ s1Arr: [Character], _ s1Index: Int, _ s2Arr: [Character], _ s2Index: Int, _ s3Arr: [Character], _ s3Index: Int) -> Bool {
        
        var s1Index = s1Index
        var s2Index = s2Index
        
        for i in s3Index..<s3Arr.count {
            // print("Iteration for s1(\(s1Index)), s2(\(s2Index)), s3(\(s3Index))")
            
            if (s1Index < s1Arr.count && s3Arr[i] != s1Arr[s1Index]) && (s2Index < s2Arr.count && s3Arr[i] != s2Arr[s2Index]) {
                // print("Characters do not match!!")
                return false
            }
            
            if (s1Index < s1Arr.count && s3Arr[i] == s1Arr[s1Index]) && (s2Index < s2Arr.count && s3Arr[i] == s2Arr[s2Index]) {
                // print("Both characters are the same.\ns1: \(s1Arr[s1Index])(\(s1Index)), s2: \(s2Arr[s2Index])(\(s2Index))")
                return check(s1Arr, s1Index+1, s2Arr, s2Index, s3Arr, i+1) ||
                check(s1Arr, s1Index, s2Arr, s2Index+1, s3Arr, i+1)
            }
            
            if s1Index < s1Arr.count && s3Arr[i] == s1Arr[s1Index] {
                // print("Taking \(s1Arr[s1Index]) at \(s1Index) from s1")
                s1Index += 1
                continue
            }
            
            if s2Index < s2Arr.count && s3Arr[i] == s2Arr[s2Index] {
                // print("Taking \(s2Arr[s2Index]) at \(s2Index) from s2")
                s2Index += 1
                continue
            }
        }
        
        // Strings match completely
        if s1Index == s1Arr.count && s2Index == s2Arr.count {
            return true
        }
        
        // print(s1Index, s2Index)
        // Only parts of string match
        return (s1Index + s2Index == s3Arr.count) && (s1Index != 0 && s2Index != 0)
    }
}

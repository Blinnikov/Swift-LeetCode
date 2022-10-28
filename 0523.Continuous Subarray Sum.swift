class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var modulos = [Int:Int]()
        modulos[0] = 0
        
        var ps = 0
        for i in 0..<nums.count {
            ps += nums[i]
            let mod = ps % k
            
            if let exist = modulos[mod] {
                if exist < i {
                    return true
                }
            } else {
                modulos[mod] = i + 1
            }
        }
        
        return false
    }
    
    private func checkSubarraySum_TLE(_ nums: [Int], _ k: Int) -> Bool {
        var pa = Array(repeating: 0, count: nums.count + 1)
        pa[0] = 0
        
        for i in 1..<pa.count {
            pa[i] = pa[i-1] + nums[i-1]
        }
        
        for i in 0..<pa.count - 2 {
            for j in i + 2..<pa.count {
                let sum = pa[j] - pa[i]
                
                if sum % k == 0 {
                    return true
                }
            }
        }
        
        return false
    }
}

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        let count = height.count
        
        var left = 0
        var right = count-1
        
        var res = 0
        
        while left < right {
            let lh = height[left]
            let rh = height[right]
            let h = min(lh, rh)
            let w = right - left
            
            res = max(res, h * w)
            
            
            if lh < rh {
                while height[left] <= lh && left < right {
                    left += 1
                }
            } else if rh < lh {
                while height[right] <= rh && left < right {
                    right -= 1
                }
            } else { // lh == rh
                var temp = left 
                while height[temp] <= lh && temp < right {
                    temp += 1
                }
                
                if temp == right {
                    break
                }
                
                left = temp
                temp = right
                
                while height[temp] <= rh && temp > left {
                    temp -= 1
                }
                
                if temp == left {
                    break
                }
            }
        }
        
        return res
    }
}

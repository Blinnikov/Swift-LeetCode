class Solution {
    func trap(_ height: [Int]) -> Int {
        var stack = [Int]()
        var res = 0
        
        for idx in 0..<height.count {
            
            while !stack.isEmpty && height[stack.last!] < height[idx] {
                let lastPoppedIdx = stack.removeLast()
                if stack.isEmpty {
                    break
                }
                
                let hollowHeight = min(height[idx], height[stack.last!]) - height[lastPoppedIdx]
                let hollowWidth = idx - stack.last! - 1
                
                res += hollowHeight * hollowWidth
            }
            
            stack.append(idx)
        }
        
        return res
    }
}

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var res = 0
        var mstack = [Int]()
        mstack.reserveCapacity(heights.count)
        
        var heights = heights
        heights.append(0)
        
        for idx in 0..<heights.count {
            while !mstack.isEmpty && heights[mstack.last!] > heights[idx] {
                let height = heights[mstack.removeLast()]
                var length: Int
                if !mstack.isEmpty {
                    length = idx - mstack.last! - 1
                } else {
                    length = idx
                }
                res = max(res, height * length)
            }
            mstack.append(idx)
        }
        
        return res
    }
}

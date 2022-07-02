class Solution {
    func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
        let horizontalCuts = horizontalCuts.sorted()
        let verticalCuts = verticalCuts.sorted()
        
        var maxHCut = max(horizontalCuts[0], h - horizontalCuts[horizontalCuts.count-1])
        for i in 0..<horizontalCuts.count-1 {
            maxHCut = max(maxHCut, horizontalCuts[i+1] - horizontalCuts[i])
        }
        
        var maxVCut = max(verticalCuts[0], w - verticalCuts[verticalCuts.count-1])
        for i in 0..<verticalCuts.count-1 {
            maxVCut = max(maxVCut, verticalCuts[i+1] - verticalCuts[i])
        }
        
        return (maxHCut * maxVCut) % 1000000007
    }
}

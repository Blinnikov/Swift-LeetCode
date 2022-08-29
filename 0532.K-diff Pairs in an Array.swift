class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var set = Set<Pair>()
        
//         set.insert(Pair(5,3))
        
//         print(set.contains(Pair(5,3)))
//         print(set.contains(Pair(3,5)))
        
        var result = 0
        
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i]-nums[j] == k || nums[j]-nums[i] == k {
                    let pair = Pair(nums[i],nums[j])
                    
                    if !set.contains(pair) && !set.contains(pair.reversed()) {
                        set.insert(pair)
                        result += 1
                    }
                }
            }
        }
        
        return result
        
        return 0
    }
    
    private struct Pair: Hashable, Equatable {
        var first: Int
        var second: Int
        
        init(_ first: Int, _ second: Int) {
            self.first = first
            self.second = second
        }
        
        func reversed() -> Pair {
            return Pair(second, first)
        }
        
        static func ==(lhs: Pair, rhs: Pair) -> Bool {
            return (lhs.first == rhs.first && lhs.second == rhs.second) || 
                (lhs.second == rhs.first && lhs.first == rhs.second)
        }
    }
}

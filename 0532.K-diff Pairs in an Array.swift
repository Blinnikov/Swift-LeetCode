class Solution {
    
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var map = [Int:Int]()
        
        for num in nums {
            map[num, default: 0] += 1
        }
        
        var res = 0
        
        for key in map.keys {
            if (k == 0 && map[key, default: 0] > 1) || (k > 0 && map[key+k] != nil) {
                res += 1
            }
        }
        
        return res
    }
    
    func findPairsSet(_ nums: [Int], _ k: Int) -> Int {
        var seen = Set<Int>()
        var ans = Set<Int>()
        
        for num in nums {
            if seen.contains(num + k), !ans.contains(num + k) {
                ans.insert(num + k)
            }
            if k != 0, seen.contains(num - k), !ans.contains(num) {
                ans.insert(num)
            }
            seen.insert(num)
            // print(seen, ans)
        }
        
        return ans.count
    }
    
    func findPairsSquare(_ nums: [Int], _ k: Int) -> Int {
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


class NumArray {
    
    private let n: Int
    private var tree: [Int]
    // private var nums: [Int]

    init(_ nums: [Int]) {
        self.n = nums.count
        // self.nums = nums
        self.tree = Array(repeating: 0, count: n*2)
        
        for i in n..<n*2 {
            tree[i] = nums[i-n]
        }
        
        for i in stride(from: n-1, through: 0, by: -1) {
            tree[i] = tree[2*i] + tree[2*i+1]
        }
    }
    
    func update(_ index: Int, _ val: Int) {
        var pos = index + n
        tree[pos] = val
        
        pos = pos / 2
        
        while pos > 0 {
            tree[pos] = tree[pos*2] + tree[pos*2+1]
            pos /= 2
        }
        
//         nums[index] = val
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var res = 0
        
        // for i in left...right {
        //     res += nums[i]
        // }
        
        var l = left + n, r = right + n
        
        while l <= r {
            if r % 2 == 0 {
                res += tree[r]
                r -= 1
            }
            if l % 2 == 1 {
                res += tree[l]
                l += 1
            }
            l /= 2
            r /= 2
        }
        
        return res
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(index, val)
 * let ret_2: Int = obj.sumRange(left, right)
 */

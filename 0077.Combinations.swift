class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res = [[Int]]()
        cycle(0, k, 1, n, [Int](), &res)
        return res
    }
    
    private func cycle(_ step: Int, _ k: Int, _ from: Int, _ to: Int, _ cur: [Int], _ res: inout[[Int]]) {
        if step == k && cur.count == k {
            res.append(cur)
            return
        }
        
        if from > to {
            return
        }
        
        for i in from...to {
            var copy = cur
            copy.append(i)
            // print(copy)
            cycle(step+1, k, i+1, to, copy, &res)
        }
    }
}

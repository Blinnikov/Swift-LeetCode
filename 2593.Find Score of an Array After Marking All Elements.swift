class Solution {
    func findScore(_ nums: [Int]) -> Int {
        var pq = PriorityQueue<Item> {
            $0.el != $1.el ? $0.el < $1.el : $0.idx < $1.idx
        }

        for i in 0..<nums.count {
            pq.enqueue(Item(el: nums[i], idx: i))
        }
        
        var mark = Array(repeating: false, count: nums.count)

        var res = 0

        while !pq.isEmpty {
            let item = pq.dequeue()!

            if !mark[item.idx] {
                res += item.el
                
                mark[item.idx] = true

                if item.idx - 1 >= 0 {
                    mark[item.idx - 1] = true
                }

                if item.idx + 1 < nums.count {
                    mark[item.idx + 1] = true
                }
            }
        }

        return res
    }
}

struct Item : Equatable {
    var el: Int
    var idx: Int
}

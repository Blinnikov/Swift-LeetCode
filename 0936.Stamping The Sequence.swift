class Solution {
    func movesToStamp(_ stamp: String, _ target: String) -> [Int] {
        var stampChars = Array(stamp)
        var targetChars = Array(target)
        var m = stamp.count
        var n = target.count
        
        var queue = [Int]()
        var list = [Node]()
        var done = Array(repeating: false, count: n)
        var ans = [Int]()
        
        for i in 0...(n-m) {
            var made = Set<Int>()
            var todo = Set<Int>()
            
            for j in 0..<m {
                if targetChars[i+j] == stampChars[j] {
                    made.insert(i+j)
                } else {
                    todo.insert(i+j)
                }
            }
            
            list.append(Node(made, todo))
            
            
            if todo.isEmpty {
                ans.append(i)
                for j in i..<(i+m) {
                    if !done[j] {
                        queue.insert(j, at: 0)
                        done[j] = true
                    }
                }
            }
        }
        
        while !queue.isEmpty {
            let i = queue.removeLast()
            
            for j in max(0, i-m+1)...(min(n-m,i)) {
                if list[j].todo.contains(i) {
                    list[j].todo.remove(i)
                    if list[j].todo.isEmpty {
                        ans.append(j)
                        for m in list[j].made {
                            if !done[m] {
                                queue.insert(m, at: 0)
                                done[m] = true
                            }
                        }
                    }
                }
            }
        }
        
        for b in done {
            if !b {
                return [Int]()
            }
        }
        
        var ret = Array(repeating: 0, count: ans.count)
        var t = 0
        while !ans.isEmpty {
            ret[t] = ans.removeLast()
            t += 1
        }
        
        return ret
    }
}

class Node {
    var made: Set<Int>, todo: Set<Int>
    
    init(_ made: Set<Int>, _ todo: Set<Int>) {
        self.made = made
        self.todo = todo
    }
}

class Solution {
    func findOriginalArray(_ changed: [Int]) -> [Int] {
        let n = changed.count
        if n & 1 == 1 {
            return []
        }
        
        var changed = changed.sorted()
        var indexes = [Int:[Int]]()
        for i in 0..<n {
            indexes[changed[i], default: []].append(i)
        }
        
        var lo = 0, hi = n-1
        var result = [Int]()
        result.reserveCapacity(n/2)
        
        for i in 0..<n/2 {
            let lo = i
            let hi = n-1-i
            
            if changed[lo] != -1 {
                let doubleLo = changed[lo] * 2
                if doubleLo == 0 && indexes[doubleLo]!.count < 2 {
                    return []
                }
                if var doubleLoIdx = indexes[doubleLo], doubleLoIdx.count > 0 {
                    let idx = indexes[doubleLo]!.removeLast()
                    changed[idx] = -1
                    result.append(changed[lo])
                    indexes[changed[lo]]!.removeFirst()
                    changed[lo] = -1
                } else {
                    return []
                }
            }
            
            if changed[hi] != -1 {
                if changed[hi] & 1 == 1 {
                    return []
                }

                let halfHi = changed[hi] / 2
                if var halfHiIdx = indexes[halfHi], halfHiIdx.count > 0 {
                    let idx = indexes[halfHi]!.removeFirst()
                    result.append(changed[idx])
                    indexes[changed[hi]]!.removeLast()
                    changed[idx] = -1
                    changed[hi] = -1

                } else {
                    return []
                }
            }
        }
        
        return result
    }
}

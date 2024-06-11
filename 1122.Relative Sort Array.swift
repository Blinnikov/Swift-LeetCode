class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var map = [Int:Int]()

        for i in 0..<arr2.count {
            map[arr2[i]] = i
        }

        var res = arr1.sorted {
            if map[$0] == nil, map[$1] == nil {
                return $0 < $1
            }

            if map[$0] == nil, let el2 = map[$1] {
                return false
            }

            if let el1 = map[$0], map[$1] == nil {
                return true
            }

            return map[$0]! < map[$1]!
        }

        return res
    }
}

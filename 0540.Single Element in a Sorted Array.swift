class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {

    }

    // O(n) time and O(n) space
    func singleNonDuplicate_On(_ nums: [Int]) -> Int {
        var map = [Int:Int]()
        for n in nums {
            map[n, default: 0] += 1
        }

        for k in map.keys {
            if map[k] == 1 {
                return k
            }
        }

        return -1
    }
}

class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var set = Set<Int>();

        for n in arr {
            if set.contains(n * 2) || (set.contains(n / 2) && n % 2 == 0) {
                return true
            }

            set.insert(n)
        }

        return false
    }
}

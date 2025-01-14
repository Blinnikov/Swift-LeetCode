class Solution {
    func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: A.count)

        var aSet = Set<Int>()
        var bSet = Set<Int>()

        for i in 0..<A.count {
            aSet.insert(A[i])
            bSet.insert(B[i])

            var count = 0

            for el in aSet {
                if bSet.contains(el) {
                    count += 1
                }
            }

            res[i] = count
        }

        return res
    }
}

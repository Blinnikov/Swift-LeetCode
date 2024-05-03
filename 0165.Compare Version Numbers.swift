class Solution {
    private let zero = Character("0").asciiValue!

    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let chars1 = Array(version1)
        let chars2 = Array(version2)

        var i1 = 0
        var i2 = 0

        var v1 = 0
        var v2 = 0

        while i1 < chars1.count || i2 < chars2.count {
            while i1 < chars1.count, chars1[i1] != "." {
                v1 = v1 * 10 + Int(chars1[i1].asciiValue! - zero)
                i1 += 1
            }

            while i2 < chars2.count, chars2[i2] != "." {
                v2 = v2 * 10 + Int(chars2[i2].asciiValue! - zero)
                i2 += 1
            }

            if v1 < v2 {
                return -1
            }

            if v1 > v2 {
                return 1
            }

            v1 = 0
            v2 = 0

            i1 += 1
            i2 += 1
        }

        return 0
    }
}

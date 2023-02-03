class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }

        let chars = Array(s)
        let n = chars.count
        var result = [Character]()
        result.reserveCapacity(n)

        let charsPerSection = (numRows - 1) * 2

        for r in 0..<numRows {
            var idx = r

            while idx < n {
                result.append(chars[idx])

                if r != 0 && r != numRows - 1 {
                    let charsBetween = charsPerSection - 2 * r
                    let middleIdx = idx + charsBetween

                    if middleIdx < n {
                        result.append(chars[middleIdx])
                    }
                }

                idx += charsPerSection
            }
        }

        return String(result)
    }
}

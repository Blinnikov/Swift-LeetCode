class Solution {
    func decodeAtIndex(_ s: String, _ k: Int) -> String {
        var k = k
        var chars = Array(s)
        var decodedLength = 0

        for i in 0..<chars.count {
            if chars[i].isNumber {
                decodedLength *= chars[i].wholeNumberValue!
            } else {
                decodedLength += 1
            }
        }

        var currentLength = decodedLength

        for i in stride(from: chars.count - 1, through: 0, by: -1) {
            if chars[i].isNumber {
                currentLength /= chars[i].wholeNumberValue!
                k %= currentLength
            } else {
                if k == 0 || k == currentLength {
                    return String(chars[i])
                }

                currentLength -= 1
            }
        }

        return ""
    }
}

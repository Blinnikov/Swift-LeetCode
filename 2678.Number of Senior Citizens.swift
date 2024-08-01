class Solution {
    func countSeniors(_ details: [String]) -> Int {
        var res = 0

        for d in details {
            let chars = Array(d)

            let age = chars[11].wholeNumberValue! * 10 + chars[12].wholeNumberValue!

            if age > 60 {
                res += 1
            }
        }

        return res
    }
}

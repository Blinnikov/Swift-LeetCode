class Solution {
    private let A = 65 // Int(("A" as UnicodeScalar).value)

    func convertToTitle(_ columnNumber: Int) -> String {
        var n = columnNumber
        var res = [Character]()

        while n > 0 {
            n -= 1

            let code = n % 26
            let ch = Character(UnicodeScalar(A + code)!)
            res.insert(ch, at: 0)

            n /= 26
        }

        return String(res)
        
    }
}

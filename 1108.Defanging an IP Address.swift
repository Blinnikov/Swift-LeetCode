class Solution {
    func defangIPaddr(_ address: String) -> String {
        var result = [Character]()
        var chars = Array(address)

        for ch in chars {
            if ch != "." {
                result.append(ch)
            } else {
                result.append("[")
                result.append(".")
                result.append("]")
            }
        }

        return String(result)
    }
}

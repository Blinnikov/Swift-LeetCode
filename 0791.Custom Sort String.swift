class Solution {
    func customSortString(_ order: String, _ s: String) -> String {
        var countMap = [Character:Int]()

        for ch in Array(order) {
            countMap[ch] = 0
        }

        let chars = Array(s)
        var res = ""

        for ch in chars {
            if let c = countMap[ch] {
                countMap[ch] = c + 1
            }
        }

        for ch in Array(order) {
            for i in 0..<countMap[ch]! {
                res += String(ch)
            }
        }

        for ch in chars {
            if countMap[ch] == nil {
                res += String(ch)
            }
        }

        return res
    }
}

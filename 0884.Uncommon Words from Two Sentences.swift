class Solution {
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        let c1 = s1.components(separatedBy: " ")
        let c2 = s2.components(separatedBy: " ")

        var m1 = [String:Int]()
        var m2 = [String:Int]()

        for s in c1 {
            m1[s, default: 0] += 1
        }

        for s in c2 {
            m2[s, default: 0] += 1
        }

        var res = [String]()

        for k in m1.keys {
            if m1[k] == 1, m2[k] == nil {
                res.append(k)
            }
        }

        for k in m2.keys {
            if m2[k] == 1, m1[k] == nil {
                res.append(k)
            }
        }

        return res
    }
}

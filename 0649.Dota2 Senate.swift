class Solution {
    func predictPartyVictory(_ senate: String) -> String {
        let s = Array(senate)
        let n = s.count 

        var dq = [Int]()
        var rq = [Int]()

        for i in 0..<n {
            if s[i] == "R" {
                rq.insert(i, at: 0)
            } else {
                dq.insert(i, at: 0)
            }
        }

        while !dq.isEmpty, !rq.isEmpty {
            let ri = rq.removeLast()
            let di = dq.removeLast()

            if ri < di {
                rq.insert(ri + n, at: 0)
            } else {
                dq.insert(di + n, at: 0)
            }
        }

        return dq.count > rq.count ? "Dire" : "Radiant"
    }
}

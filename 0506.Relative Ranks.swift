class Solution {
    func findRelativeRanks(_ score: [Int]) -> [String] {
        let sortedScore = score.sorted { $1 < $0 }

        var map = [Int:String]()

        for i in 0..<sortedScore.count {
            let rank = switch i {
                case 0: "Gold Medal";
                case 1: "Silver Medal";
                case 2: "Bronze Medal";
                default: "\(i + 1)";
                
            }

            map[sortedScore[i]] = rank
        }

        var res = Array(repeating: "", count: score.count)

        for i in 0..<score.count {
            res[i] = map[score[i]]!
        }

        return res
    }
}

class Solution {
    func winnerOfGame(_ colors: String) -> Bool {
        if colors.count < 3 {
            return false
        }

        var colors = Array(colors)
        var alice = 0
        var bob = 0

        for i in 1...(colors.count - 2) {
            if colors[i] == colors[i - 1], colors[i] == colors[i + 1] {
                if colors[i] == "A" {
                    alice += 1
                } else {
                    bob += 1
                }
            }
        }

        return alice > bob
    }
}

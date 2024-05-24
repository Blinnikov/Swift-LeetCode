class Solution {
    private var words = [String]()
    private var score = [Int]()

    private var res = 0
    private var charsCount = [Character:Int]()

    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        self.words = words
        self.score = score

        for ch in letters {
            charsCount[ch, default: 0] += 1
        }

        traverse(0, 0, charsCount)

        return res
    }

    private func traverse(_ idx: Int, _ current: Int, _ charsCount: [Character:Int]) {
        res = max(res, current)

        if idx == words.count {
            return
        }

        for i in idx..<words.count {
            var count = charsCount
            var sc = 0
            var valid = true

            for ch in Array(words[i]) {
                if count[ch, default: 0] > 0 {
                    count[ch, default: 0] -= 1
                    sc += score[Int(ch.asciiValue! - Character("a").asciiValue!)]
                } else {
                    valid = false
                    break
                }
            }

            if valid {
                traverse(i + 1, current + sc, count)
            } 
        }
    }
}

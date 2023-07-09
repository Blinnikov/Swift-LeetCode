class Solution {
    func largestVariance(_ s: String) -> Int {
        var frequencies = [Character:Int]()
        let chars = Array(s)
        
        for ch in chars {
            frequencies[ch, default: 0] += 1
        }

        var res = 0

        for aIdx in 0..<26 {
            let a = intToChar(aIdx)

            for bIdx in 0..<26 {
                let b = intToChar(bIdx)

                var freqA = frequencies[a, default: 0]
                var freqB = frequencies[b, default: 0]

                if a == b || freqA == 0 || freqB == 0 {
                    continue
                }

                var curFreqA = 0
                var curFreqB = 0

                for c in chars {
                    if b == c {
                        curFreqB += 1
                    }

                    if a == c {
                        curFreqA += 1
                        freqA -= 1
                    }

                    if curFreqA > 0 {
                        res = max(res, curFreqB - curFreqA)
                    }

                    if curFreqB < curFreqA, freqA >= 1 {
                        curFreqA = 0
                        curFreqB = 0
                    }
                }
            }
        }

        return res
    }

    private func intToChar(_ idx: Int) -> Character {
        Character(UnicodeScalar(Int(UnicodeScalar("a").value) + idx)!)
    }
}

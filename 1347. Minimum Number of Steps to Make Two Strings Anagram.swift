class Solution {
    let a = Character("a").asciiValue!

    func minSteps(_ s: String, _ t: String) -> Int {
        let charsS = Array(s)
        let charsT = Array(t)
        
        var arr = Array(repeating: 0, count: 26)

        for i in 0..<charsS.count {
            arr[Int(charsS[i].asciiValue! - a)] += 1
            arr[Int(charsT[i].asciiValue! - a)] -= 1
        }

        print(arr)

        return arr.reduce(0, { $0 + ($1 > 0 ? $1 : 0) })
    }
}

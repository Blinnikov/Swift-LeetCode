class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let n = temperatures.count
        var stack = [Int]()
        var result = Array(repeating: 0, count: n)

        for i in 0..<n {
            while !stack.isEmpty, temperatures[i] > temperatures[stack.last!] {
                let idx = stack.removeLast()
                result[idx] = i - idx
            }
            stack.append(i)
        }

        return result
    }
}

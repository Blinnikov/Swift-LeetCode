class Solution {
    private let a = Character("A").asciiValue!
    
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var frequencies = Array(repeating: 0, count: 26)
        
        for ch in tasks {
            frequencies[Int(ch.asciiValue! - a)] += 1
        }
        
        frequencies.sort()
        let maxIntervals = frequencies[25] - 1
        var spaces = maxIntervals * n
        
        for i in stride(from: 24, through: 0, by: -1) {
            spaces -= min(maxIntervals, frequencies[i])
        }
        
        return tasks.count + max(0, spaces)
    }
}

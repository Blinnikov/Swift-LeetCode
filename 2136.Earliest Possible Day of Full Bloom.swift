class Solution {
    func earliestFullBloom(_ plantTime: [Int], _ growTime: [Int]) -> Int {
        let indices = Array(0..<growTime.count).sorted(by: { growTime[$0] > growTime[$1] })
        // print(indices)
        
        var result = 0
        var currentPlantTime = 0
        
        for i in 0..<growTime.count {
            let idx = indices[i]
            let currentTime = currentPlantTime + plantTime[idx] + growTime[idx]
            result = max(result, currentTime)
            currentPlantTime += plantTime[idx]
        }
        
        return result
    }
}

class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        var boxes = boxTypes.sorted { $0[1] > $1[1] }
        
        var count = truckSize
        var sum = 0, idx = 0
        
        while count > 0 && idx < boxes.count {
            let boxesToTake = min(boxes[idx][0], count)
            sum += (boxesToTake * boxes[idx][1])
            count -= boxesToTake
            idx += 1
        }
        
        return sum
    }
}

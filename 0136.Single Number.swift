class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        nums.reduce(0, ^)
//         var map = [Int:Bool]()
        
//         for n in nums {
//             if let curr = map[n] {
//                 map.removeValue(forKey: n)
//             } else {
//                 map[n] = true
//             }
//         }
        
//         return map.first!.key
    }
}

class Solution {
    func fullBloomFlowers(_ flowers: [[Int]], _ people: [Int]) -> [Int] {
        var start = Array(repeating: 0, count: flowers.count)
        var end = Array(repeating: 0, count: flowers.count)

        for i in 0..<flowers.count {
            start[i] = flowers[i][0]
            end[i] = flowers[i][1]
        }

        start.sort()
        end.sort()

        return people.map { p in 
            binarySearch(start, { $0 <= p }) - binarySearch(end, { $0 < p }) 
        }
    }

    func binarySearch(_ arr: [Int], _ predicate: (Int) -> Bool) -> Int {
        var lo = 0
        var hi = arr.count

        while lo < hi {
            let mid = (lo + hi) / 2

            if predicate(arr[mid]) {
                lo = mid + 1
            } else {
                hi = mid
            }
        }

        return lo
    }
}

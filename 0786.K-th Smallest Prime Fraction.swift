class Solution {
    func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
        var a = [(Double, Int, Int)]()

        for i in 0..<arr.count {
            for j in (i+1)..<arr.count {
                a.append((Double(arr[i]) / Double(arr[j]), arr[i], arr[j]))
            }
        }

        a.sort { $0.0 < $1.0 }

        return [a[k - 1].1, a[k - 1].2]
    }
}

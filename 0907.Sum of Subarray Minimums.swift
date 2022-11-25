class Solution {
    private let mod = 1000000007

    func sumSubarrayMins(_ arr: [Int]) -> Int {
        var stack = [Int]();
        var res = 0;

        for i in 0...arr.count {
            while !stack.isEmpty && (i == arr.count || arr[stack.last!] >= arr[i]) {
                let mid = stack.removeLast()
                let left = stack.isEmpty ? -1 : stack.last!
                let right = i

                let count = (mid - left) * (right - mid) % mod
                res += (count * arr[mid]) % mod
                res %= mod
            }
            stack.append(i)
        }

        return res

        // var res = 0

        // for start in 0..<arr.count {
        //     for end in start..<arr.count {
        //         res += (arr[start...end].min()! % mod)
        //     }
        // }

        // return res % mod
    }
}

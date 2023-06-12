class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.count == 0 {
            return []
        }

        if nums.count == 1 {
            return ["\(nums[0])"]
        }

        if nums.count == 2 {
            return nums[0] == nums[1] - 1 ? [toString(nums)] : ["\(nums[0])", "\(nums[1])"]
        }

        var result = [String]()
        var subRes = Array(repeating: nums[0], count: 2)

        for i in 1..<nums.count {
            if nums[i] != subRes[1] + 1{
                result.append(toString(subRes))
                
                subRes[0] = nums[i]
                subRes[1] = nums[i]
            } else {
                subRes[1] = nums[i]
            }
        }

        result.append(toString(subRes))

        return result
    }

    private func toString(_ arr: [Int]) -> String {
        if arr.count != 2 {
            return ""
        }

        return arr[0] == arr[1] ? "\(arr[0])" : "\(arr[0])->\(arr[1])"
    }
}

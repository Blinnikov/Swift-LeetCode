public class Solution {
    public int[] TwoSum(int[] nums, int target) {
        var map = new Dictionary<int,int>();
        
        for(int i = 0; i < nums.Length; i++) {
            map[target-nums[i]] = i;
        }
        
        for(int i = 0; i < nums.Length; i++) {
            if(map.ContainsKey(nums[i]) && map[nums[i]] != i) {
                return new int[2] { i, map[nums[i]] };
            }
        }
        
        return new int[0];
        
    }
}

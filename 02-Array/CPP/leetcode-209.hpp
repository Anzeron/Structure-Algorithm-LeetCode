//
//  leetcode-209.hpp
//  02-Array
//
//  Created by Anzeron on 2021/12/7.
//

/**
 来源：力扣（LeetCode）209 Medium
 链接：https://leetcode-cn.com/problems/minimum-size-subarray-sum
 
 给定一个含有 n 个正整数的数组和一个正整数 target 。

 找出该数组中满足其和 ≥ target 的长度最小的 连续子数组 [numsl, numsl+1, ..., numsr-1, numsr] ，并返回其长度。如果不存在符合条件的子数组，返回 0 。

 示例 1：
 输入：target = 7, nums = [2,3,1,2,4,3]
 输出：2
 解释：子数组 [4,3] 是该条件下的长度最小的子数组。
 
 示例 2：
 输入：target = 4, nums = [1,4,4]
 输出：1
 
 示例 3：
 输入：target = 11, nums = [1,1,1,1,1,1,1,1]
 输出：0

 */

#include <iostream>
#include <vector>

using namespace std;

namespace LeetCode209 {

class Solution {
public:
    int minSubArrayLen(int target, vector<int>& nums) {
        // [left, right]表示窗口区间，初始窗口区间长度为0，和为0
        int left = 0;
        int right = -1;
        int sum = 0;
        
        int numsLength = nums.size();
        int resultLength = numsLength + 1;
        while (left < numsLength) {
            // 区间和小于目标值，右下标尝试扩大区间
            if (sum < target && right + 1 < numsLength) {
                right++;
                sum += nums[right];
            } else {        // 区间和大于目标值或者右下标到头，增加左下标，区间缩小
                sum -= nums[left];
                left++;
            }
            
            // 取较小的结果
            if (sum >= target) {
                resultLength = min(resultLength, right - left + 1);
            }
        }
        
        if (resultLength == numsLength + 1) {
            return 0;
        }
        
        return resultLength;
    }
};

void run() {
    Solution s;
    vector<int> v = {2,3,1,2,4,3};
    int result = s.minSubArrayLen(7, v);
    std::cout << "LeetCode209 result: " << result << std::endl;
}

}



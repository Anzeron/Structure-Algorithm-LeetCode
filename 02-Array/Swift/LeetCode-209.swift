//
//  LeetCode-209.swift
//  02-Array
//
//  Created by Anzeron on 2021/12/9.
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

import Foundation

class LeetCode209 {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        // [left, right]表示窗口区间，初始窗口区间长度为0，和为0
        var left = 0
        var right = -1
        var sum = 0
        
        let numsLength = nums.count
        var resultLength = numsLength + 1
        while left < numsLength {
            // 区间和小于目标值，右下标尝试扩大区间
            if (sum < target) && (right + 1 < numsLength) {
                right += 1
                sum += nums[right]
            } else {    // 区间和大于目标值或者右下标到头，增加左下标，区间缩小
                sum -= nums[left]
                left += 1
            }
            
            // 取较小的结果
            if sum >= target {
                resultLength = min(resultLength, (right - left + 1))
            }
        }
        
        if resultLength ==  numsLength + 1{
            return 0
        }
        
        return resultLength
    }

    static func run() -> Void {
        let s = LeetCode209()
        let nums = [2,3,1,2,4,3]
        let result = s.minSubArrayLen(7, nums)
        print("LeetCode209 result:",result)
    }
}

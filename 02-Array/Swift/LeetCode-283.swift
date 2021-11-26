//
//  LeetCode-283.swift
//  02-Array
//
//  Created by Anzeron on 2021/11/26.
//

/**
 
 来源：力扣（LeetCode）283 Easy
 链接：https://leetcode-cn.com/problems/move-zeroes
 
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:

 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 
 */

import Foundation

class LeetCode283 {
    func moveZeroes(_ nums: inout [Int]) {
        solution0(&nums)
    }
    
    func solution0(_ nums: inout [Int]) -> Void {
        // [0,i)的元素均为非0元素
        var i = 0
        
        let length = nums.count
        for j in 0..<length {
            // 找到非0元素，交换到区间[0,i)
            if nums[j] != 0 {
                if i != j {
                    nums.swapAt(i, j)
                    i += 1
                } else {
                    // 处理所有元素都是非0的情况
                    i += 1
                }
            }
        }
    }
    
    static func run() -> Void {
        let s = LeetCode283()
        var nums = [0,1,0,3,12]
        s.moveZeroes(&nums)
        print(nums)
    }
}

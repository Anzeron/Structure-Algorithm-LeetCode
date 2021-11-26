//
//  LeetCode-27.swift
//  02-Array
//
//  Created by Anzeron on 2021/11/26.
//

/**
 
 来源：力扣（LeetCode）27 Easy
 链接：https://leetcode-cn.com/problems/remove-element
 
 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。

 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。

 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

 示例 1：

 输入：nums = [3,2,2,3], val = 3
 输出：2, nums = [2,2]
 解释：函数应该返回新的长度 2, 并且 nums 中的前两个元素均为2。你不需要考虑数组中超出新长度后面的元素。例如，函数返回的新长度为 2 ，而 nums = [2,2,3,3] 或 nums = [2,2,0,0]，也会被视作正确答案。
 
 示例 2：

 输入：nums = [0,1,2,2,3,0,4,2], val = 2
 输出：5, nums = [0,1,4,0,3]
 解释：函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。注意这五个元素可为任意顺序。你不需要考虑数组中超出新长度后面的元素。

 */

import Foundation

class LeetCode27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        solution0(&nums, val)
    }
    
    func solution0(_ nums: inout [Int], _ val: Int) -> Int {
        // [0,i)的元素均为非指定元素
        // i也表示区间长度
        var i = 0
        
        let length = nums.count
        for j in 0..<length {
            // 找到非0元素，交换到区间[0,i)
            if nums[j] != val {
                if i != j {
                    nums.swapAt(i, j)
                    i += 1
                } else {
                    // 数组内都是非指定元素的情况
                    i += 1
                }
            }
        }
        
        return i
    }
    
    static func run() -> Void {
        let s = LeetCode27()
        var nums = [0,1,2,2,3,0,4,2]
        let len = s.removeElement(&nums,2)
        print("length:",len)
        print(nums)
    }
}


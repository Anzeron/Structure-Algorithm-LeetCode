//
//  LeetCode-80.swift
//  02-Array
//
//  Created by Anzeron on 2021/11/26.
//

/**
 来源：力扣（LeetCode）80 Medium
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array-ii
 
 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 最多出现两次 ，返回删除后数组的新长度。

 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
 
 示例 1：

 输入：nums = [1,1,1,2,2,3]
 输出：5, nums = [1,1,2,2,3]
 解释：函数应返回新长度 length = 5, 并且原数组的前五个元素被修改为 1, 1, 2, 2, 3 。 不需要考虑数组中超出新长度后面的元素。
 
 示例 2：

 输入：nums = [0,0,1,1,1,1,2,3,3]
 输出：7, nums = [0,0,1,1,2,3,3]
 解释：函数应返回新长度 length = 7, 并且原数组的前五个元素被修改为 0, 0, 1, 1, 2, 3, 3 。 不需要考虑数组中超出新长度后面的元素。

 */

import Foundation

class LeetCode80 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        return solution0(&nums)
    }
    
    func solution0(_ nums: inout [Int]) -> Int {
        // [i,j)表示最新的保留元素区间
        // j也表示新数组长度
        var i = 0;
        var j = 0;
        
        let length = nums.count;
        for k in 0..<length {
            let iNum = nums[i];
            let kNum = nums[k];
            if (iNum == kNum) {
                // 当前区间小于2，把kNum交换到[i,j)
                // 再扩大区间
                if (j - i < 2) {
                    if (j != k) {
                        nums.swapAt(j, k)
                    }
                    j += 1;
                }
            } else {
                // 向右移动区间，将新的元素nums[k]交换到该区间
                i = j;
                j = j + 1;
                if (i != k) {
                    nums.swapAt(i, k)
                }
            }
        }

        return j
    }
    
    static func run() -> Void {
        let s = LeetCode80()
        var nums = [0,0,1,1,1,1,2,3,3]
        let len = s.removeDuplicates(&nums)
        print("length:",len)
        print(nums)
    }
}

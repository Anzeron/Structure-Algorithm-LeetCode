//
//  leetcode-27.hpp
//  02-Array
//
//  Created by Anzeron on 2021/11/22.
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

#include <iostream>
#include <vector>

using namespace std;

namespace LeetCode27 {

class Solution {
public:
    int removeElement(vector<int>& nums, int val) {
        return solution0(nums, val);
    }
    
    int solution0(vector<int>& nums, int val) {
        int i = 0; // [0...i)的元素均为非指定元素

        // [i...j] 为指定元素
        vector<int>::size_type length = nums.size();
        for(int j = 0 ; j < length ; j++) {
            if(nums[j] != val) {      // 找到非指定元素，要移动到[0...i)
                if (i != j) {       // 处理所有元素都是非指定元素的情况
                    swap(nums[i], nums[j]);
                    i++;
                } else {
                    i++;
                }
            }
        }
        
        return i;       // i表示非指定元素的长度
    }
};

void run() {
    Solution s;
    vector<int> v = {0,1,2,2,3,0,4,2};
    int target = 2;
    int size = s.removeElement(v, target);
    std::cout << size << std::endl;
}

}


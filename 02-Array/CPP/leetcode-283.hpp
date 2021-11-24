//
//  leetcode-283.hpp
//  02-Array
//
//  Created by Anzeron on 2021/11/19.
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

#include <iostream>
#include <vector>

using namespace std;

namespace LeetCode283 {

class Solution {
public:
    void moveZeroes(vector<int>& nums) {
        solution0(nums);
    }
    
    void solution0(vector<int>& nums) {
        int i = 0; // [0...i)的元素均为非0元素

        // [i...j] 为0
        vector<int>::size_type length = nums.size();
        for(int j = 0 ; j < length ; j++) {
            if(nums[j] != 0) {      // 找到非零元素，要移动到[0...i)
                if (i != j) {       // 处理所有元素都是非零的情况
                    swap(nums[i], nums[j]);
                    i++;
                } else {
                    i++;
                }
            }
        }
    }
};

void run() {
    Solution s;
    vector<int> v = {0,1,0,3,12};
    s.moveZeroes(v);
}

}

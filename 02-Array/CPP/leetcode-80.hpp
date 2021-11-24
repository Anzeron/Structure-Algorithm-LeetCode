//
//  leetcode-80.hpp
//  02-Array
//
//  Created by Anzeron on 2021/11/23.
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

#include <iostream>
#include <vector>

using namespace std;

namespace LeetCode80 {

class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        return solution0(nums);
    }
    
    int solution0(vector<int>& nums) {
        // [i,j)区间的元素表示当前有效的元素区间
        // j也表示新长度
        int i = 0;
        int j = 0;
        
        vector<int>::size_type length = nums.size();
        for(int k = 0 ; k < length ; k++) {
            int i_num = nums[i];
            int k_num = nums[k];
            if (i_num == k_num) {
                // 当前区间小于2，就要把k_num搬到[i,j)
                if (j - i < 2) {
                    if (j != k) {
                        swap(nums[j], nums[k]);
                    }
                    j++;
                }
            } else {
                // 更新当前有效的区间[i,j)
                i = j;
                j = j + 1;
                if (i != k) {
                    swap(nums[i], nums[k]);
                }
            }
        }

        return j;
    }
};

void run() {
    Solution s;
    vector<int> v = {0,0,1,1,1,1,2,3,3};
    int size = s.removeDuplicates(v);
    std::cout << size << std::endl;
}

}


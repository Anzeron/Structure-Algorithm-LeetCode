//
//  LeetCode20.swift
//  04-Stack
//
//  Created by Anzeron on 2022/1/13.
//
/**
 来源：力扣（LeetCode）20 Easy
 链接：https://leetcode-cn.com/problems/valid-parentheses
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 
 示例 2：

 输入：s = "()[]{}"
 输出：true
 
 示例 4：

 输入：s = "([)]"
 输出：false
 */

import Foundation

class LeetCode20 {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()  // 模拟栈
        let info : [Character : Character] = [
            "(" : ")",
            "{" : "}",
            "[" : "]",
        ]
        
        for c in s {
            if (info[c] != nil) {
                stack.append(c) // 左边符号入栈
            } else {
                if let last = stack.last, let last2 = info[last] {
                    if last2 != c { // 左右不匹配
                        return false
                    }
                    stack.removeLast()  // 左右匹配，出栈
                } else {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
    
    static func run() -> Void {
        let isValid = LeetCode20().isValid("()[]{}")
        print(isValid)
    }
}

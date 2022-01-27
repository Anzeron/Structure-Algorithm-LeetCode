//
//  LeetCode509.swift
//  06-Recursion
//
//  Created by Anzeron on 2022/1/27.
//
/**
 来源：力扣（LeetCode）509 Easy
 链接：https://leetcode-cn.com/problems/fibonacci-number
 
 斐波那契数 （通常用 F(n) 表示）形成的序列称为 斐波那契数列 。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：

 F(0) = 0，F(1) = 1
 F(n) = F(n - 1) + F(n - 2)，其中 n > 1
 给定 n ，请计算 F(n) 。
 */

import Foundation

class LeetCode509 {
    func fib(_ n: Int) -> Int {
        // 初始化栈，求f(n)
        var stack: [Int] = [Int]()
        stack.append(n)
        
        var result = 0
        
        while !stack.isEmpty {
            if let num = stack.popLast() {
                if num == 0 {
                    result += 0
                } else if num == 1 {
                    result += 1
                } else {
                    stack.append(num - 2)
                    stack.append(num - 1)
                }
            }
        }
        
        return result
    }
}

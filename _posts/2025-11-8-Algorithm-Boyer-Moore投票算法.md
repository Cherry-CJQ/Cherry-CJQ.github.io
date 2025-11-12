---
title: 一个有趣的算法：Boyer-Moore投票算法
date: 2025-11-08 14:00:00 +0800
categories: [算法]
tags: 
  - 算法
  - 投票算法
---
## **一、背景**

Boyer-Moore投票算法是一种用于在数组中寻找多数元素的高效算法。多数元素是指在数组中出现次数超过一半的元素。该算法由Robert S. Boyer和J Strother Moore于1981年提出，具有线性时间复杂度和常数空间复杂度。

## **二、算法设计**

### **2.1问题定义**

Boyer-Moore投票算法要解决什么问题？

1. 在一个数组中，找到出现次数超过一半的元素（多数元素）。
2. 如果不存在多数元素，算法应返回一个指示不存在的结果。

### **2.2算法思路**

Boyer-Moore投票算法的核心思想是通过“抵消”不同元素的出现次数来找到多数元素。具体步骤如下：

1. 初始化两个变量：候选元素candidate和计数器count，初始值分别为None和0。
2. 遍历数组中的每个元素num：
   - 如果count为0，将candidate设置为当前元素num，并将count设为1。
   - 如果num等于candidate，增加count的值（count++）。
   - 如果num不等于candidate，减少count的值（count--）。
3. 遍历结束后，candidate即为可能的多数元素。
4. 为了确认candidate是否为多数元素，需要进行第二次遍历，计算candidate在数组中的出现次数，并与数组长度的一半进行比较。（如果题目明确指出数组中一定存在多数元素，则可以省略这一步。）
   - 如果candidate的出现次数超过数组长度的一半，那么candidate即为多数元素。
   - 否则，数组中不存在多数元素。

### **2.3伪代码**

```bash
count ← 0
for each a in A:
    if count == 0:
        candidate ← a
        count ← 1
    else if a == candidate:
        count ← count + 1
    else:
        count ← count - 1
```

### **为什么有效？**

- Boyer-Moore投票算法之所以有效，是因为它利用了多数元素的定义：如果一个元素在数组中出现的次数超过一半，那么即使与其他所有不同元素的出现次数相抵消，最终该元素仍然会留下来。
- 通过这种“抵消”机制，算法能够在一次遍历中找到候选元素，并在第二次遍历中验证其有效性。

## **三、代码实现（Java）**

### **3.1Java实现**

```java
public class MajorityElement {
    
    /**
     * 使用 Boyer-Moore 投票算法寻找多数元素
     * 时间复杂度: O(n)
     * 空间复杂度: O(1)
     */
    public static int majorityElement(int[] nums) {
        int candidate = nums[0];  // 初始化候选元素
        int count = 1;            // 初始化计数器
        
        // 遍历数组（从第二个元素开始）
        for (int i = 1; i < nums.length; i++) {
            if (count == 0) {
                // 如果计数器为0，更新候选元素
                candidate = nums[i];
                count = 1;
            } else if (nums[i] == candidate) {
                // 如果当前元素等于候选元素，计数器加1
                count++;
            } else {
                // 如果当前元素不等于候选元素，计数器减1
                count--;
            }
        }
        
        return candidate;
    }
}
```

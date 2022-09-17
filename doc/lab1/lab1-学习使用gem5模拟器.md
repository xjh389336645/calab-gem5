# 实验一  学习使用gem5模拟器
## 实验目的
1.	熟悉gem5模拟器实验环境
2.	初步理解gem5进行硬件仿真和模拟执行程序的过程
3.	学习分析gem5的输出统计文件
4.	对gem5的模拟执行程序流程有一个整体的理解

## 实验要求
阅读gem5指引文档
地址：https://www.gem5.org/documentation/learning_gem5/introduction/

1.	阅读指引文档的Introduction和Getting Started部分
2.	安装一台至少8G内存，存储空间>=20G的Ubuntu虚拟机
3.	下载gem5模拟器，阅读Getting started的building gem5章节，跟随要求在虚拟机上进行gem5的编译
4.	阅读Getting started的Creating a simple configuration script章节和Adding cache to the configuration script章节，编写配置文件并使用配置文件模拟运行样例程序
5.	阅读Getting started的后续章节，学习和了解gem5输出的统计文件内容，如何使用gem5自带的配置文件进行模拟


## 注意：
1.	请确定配置的Ubuntu虚拟机安装有python3

2.	编译gem5路径最好不要包含中文

3.	编译gem5时，有一点需要注意，请把编译指令改为：
   	scons build/X86/gem5.opt -jX CPU_MODELS=AtomicSimpleCPU,TimingSimpleCPU,O3CPU,MinorCPU 
       (其中-jX的X是你的计算机系统核数+1)

## 实验需要提交的内容包括：

1.	跟随新手教程编写的配置文件(simple.py, caches.py, two_level.py),代码文件请对你觉得有助于理解的部分加上注释。
2.	实验报告，其中需要有(1)在虚拟机上成功编译gem5截图;(2)运行simple.py的结果命令行截图;(3)运行two_level.py的结果命令行截图;(4)流程简述

## 评分标准
1. 实验提交的源代码可以正常执行，能获得7分基本分
2. 实验报告包含要求全部内容，能获得3分

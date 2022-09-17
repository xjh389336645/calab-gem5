# 实验二 使用gem5对benchmark做性能分析
## 实验目的
1.	学习通过程序运行数据对程序和执行程序的硬件做性能分析
2.	加深对不同硬件配置对程序性能影响的理解
3.	熟悉gem5模拟运行程序的流程

## 实验要求
1.	本次实验使用了一些简单的benchmark(mm,spmv,lfsr,merge,sieve)，附加在lab2文件夹中，请下载到虚拟机并按照readme编译
2.	选择使用在实验一里创建的gem5配置脚本，或是使用gem5自带的配置文件se.py。如果使用前者，你可能需要在 python 文件中添加参数，以便轻松更改 CPU 型号、频率等。
3.	在实验开始前请保持配置文件为以下配置：
* CPU: DerivO3CPU (the OOO core)

* Frequency: 1Ghz 

* Memory: DDR3_1600_8x8 

* 2-level cache hierarchy (64KB L1 icache, 64KB L1 dcache, 2MB L2) 

*  Issue Width=8
接下来，你需要通过阅读教学文档，阅读源码等方式寻找修改以下配置的方法，并按照实验要求进行修改和测试。
(1)	改变CPU型号(DerivO3CPU / MinorCPU)
(2)	改变Issue Width(Issue Width=2 / Issue Width=8)
(3)	改变CPU时钟频率(CPU clock=1 GHz / 4GHz)
(4)	改变L2 Cache(No L2 Cache / 256KB L2 / 2MB L2 / 16MB L2)

    需要测试的配置列表
    -----
    CPU_type |	Issue width |	CPU_clock |	L2 cache |
    -|-|-|-
    O3CPU |	8 |	1GHz |	No |
    MinorCPU |	8 |	1GHz |	No |
    O3CPU |	2 |	1GHz |	No |
    O3CPU |	8 |	4GHz |	No |
    O3CPU |	8 |	1GHz |	256kB |
    O3CPU |	8 |	1GHz |	2MB |
    O3CPU |	8 |	1GHz |	16MB |
   ----
由表，对于每个benchmark，共需要跑7次gem5。


    注意：
    (1)	模拟器的每次运行都会产生一个统计数据文件作为输出——保存每次运行生成的统计文件。警告：默认情况下，gem5 每次都会将输出文件写入同一个文件夹（m5out）。确保在每次后续运行之前在其他位置保存好本次的输出文件。
    (2)	默认情况下，gem5 不会配置为编译 X86 的 MinorCPU 模型。(这也是为什么在实验一需要手动指定编译的CPU类型，如果你没有按照实验一的实验文档进行编译，可能需要重新编译gem5)
    (3)	如果你不确定自己做出的修改能否真的修改模拟硬件的配置，不妨去查看m5out文件夹下的输出文件

4.	完成第三步，收集完成数据后，分析统计数据，并回答以下问题。(如果对回答问题有帮助，你也可以尝试使用其他配置运行)

    1.	应该使用什么指标来比较不同系统配置之间的性能？为什么？
    2.	是否有任何基准测试受益于删除 L2 缓存？请说明理由。
    3.  在讨论程序的运行行为时，我们会遇到a) memory regularity，b) control regularity，和 c) memory locality，请谈一谈你对他们的理解。
    4.	对于这三个程序属性——a) memory regularity，b) control regularity，和 c) memory locality——从 stats.txt 中举出一个统计指标（或统计指标的组合），通过该指标你可以区分一个workload是否具有上述的某一个属性。 （例如，对于control regularity，它与分支指令的数量成反比。但你一定可以想到一个更好的）。 
    5.	对于每一个实验中用到的benchmark，描述它的a) memory regularity, b) control regularity, c) locality；解释该benchmark对哪个微架构参数最敏感（换句话说，你认为“瓶颈”是什么），并使用推理或统计数据来证明其合理性。
    6.	选择一个benchmark，提出一种你认为对该benchmark非常有效的应用程序增强、ISA 增强和微体系结构增强。
## 实验需要提交的内容包括：
a)	实验获得的统计数据，请按照benchmark的名字和配置进行保存和提交，无法分辨目标benchmark和配置的提交结果认为提交无效。
b)	实验报告，需要包括的内容: (1)修改第三步中配置的方法;(2)第4步中全部问题的分析和回答
## 评分标准
1.	完成实验的基本要求，即提交的实验统计数据满足要求，并能说明如何进行配置的修改，能获得5分。
2.	实验报告占5分


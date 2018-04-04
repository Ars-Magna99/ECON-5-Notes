2018年4月2日 第一次阅读
--------------------

R语句由函数和赋值构成。 *R使用<-而非传统的=来赋值*
<br>`x <- rnorm(5)` 或者`rnorm(5)->x`皆可。
<br>注释用`#`开头。

* 用`c`可以将数据以向量的形式输入

```
> age <- c(1,3,5,2,11,9,3,9,12,3)
> weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)

> mean(weight)
[1] 7.06
> sd(weight)
[1] 2.077498
> cor(age,weight)
[1] 0.9075655
> plot(age,weight)
```
<br> ∴ 这组婴儿的平均体重是7.06千克；标准差是2.08千克；月龄和体重存在较强的线性关系。

* 获取帮助：
```
help(函数名)或？函数名   #查看关于函数名的帮助
example（函数名）       #查看函数的范例
```

* 查看工作路径
`getwd()`
```
> getwd()
[1] "/Users/ziyangwang"
```
  修改工作路径
  `setwd()`

* **启动R以后会默认开始一个交互式对话，从键盘接受输入。不过也可以处理卸载一个脚本文件中的命令集并直接把结果输出。**	

1. 输入
```
#在当前对话中运行一个脚本，如果文件名不包含路径，那么将默认在工作路径中寻找。
source（"filename"）
```

2. 文本输出
<br>&ensp;`sink("filename")` 	将输出重定向到文件内。
<br>&ensp;参数`append = true`会将输出文本添加在后面，而不是覆盖源文件。
<br>&ensp;参数`split = true` 可以把输出同时定向到屏幕和文件

3. 图形输出
```
pdf（“pdffile.pdf"）
png("filename.png")
jpeg)("filename.jpeg")
```
* 1.4 包（package）
<br>&ensp可选模块的安装和使用。用户贡献的模块可以从
&emsp；http://cran.r-project.org/web/packages  下载

<br>&ensp;Q:什么是包？
<br>&ensp;A: 包是R函数、数据和预编译代码以一种定义完善的方式组合成的集合。计算机上储存包的目录称为*库（library）*
`library()` 显示目前库中所有的包

下载的二进制程序包（ggplot2）在
	<br>/var/folders/yt/x2pcqd8913q476l9hc2d9zgc0000gn/T//RtmpCpmz9v/downloaded_packages里
  
* 1.5 批处理 
<br>&emsp; 有的时候交互式的编程比较繁琐，我们会希望以一种重复的、程序化的、无人值守的方式来执行某个R程序。这时候就需要写一个程序，在批处理模式下执行。
<br>对终端使用命令：``R CMD BATCH options infile outfile`` infile是执行的R代码所在的文件，outfile是接收输出文件的文件名，option则是一些细节的控制。按照惯例，infile的扩展名是R，outfile是Rout.

* 1.7处理  大数据包
<br> R可以处理GB到TB级别的数据集

*
<br>
<br>

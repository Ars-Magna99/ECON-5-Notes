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

## 2018年4月5日 第二章：创建数据集
<br>数据集是由观测数据组成的一个矩形数组，__行表示观测，列表示变量。__
<br>R可以处理数值型、逻辑型、字符型、复数型（虚数）、原生型（字节）变量。但是我们需要在输入数据的时候告诉R这些变量是什么类型。
<br> 
* 数据结构：向量，矩阵，数组，数据框
<br> &emsp;向量：储存数值型、字符型和逻辑型的__一维数组__。``c()``函数可在R中创建一个向量。
<br> &emsp;矩阵：二维数组。每个元素类型必须相同，通过``matrix()``来创建
```r
#生成一个5*4的矩阵
> y <- matrix(1:20,nrow=5,ncol = 4)
> y
     [,1] [,2] [,3] [,4]
[1,]    1    6   11   16
[2,]    2    7   12   17
[3,]    3    8   13   18
[4,]    4    9   14   19
[5,]    5   10   15   20

```
<br>

```r
#生成一个2*2的矩阵，按行进行填充以后再按列进行填充。
> cells <- c(1,26,24,68)
> cnames  <-c("C1","C2")
> mymatrix <- matrix(cells,nrow=2,ncol=2,byrow=TRUE,dimnames = list(rnames,cnames))
> mymatrix
   C1 C2
R1  1 26
R2 24 68
> mymatrix <- matrix(cells,nrow=2,ncol=2,byrow=FALSE,dimnames = list(rnames,cnames))
> mymatrix
   C1 C2
R1  1 24
R2 26 68
```
<br>

```r
> wzycell <- c(6,3,2,0,5,1,1,4,6)
> cnames <-c("C1","C2","C3")
> rnames <-c("R1","R2","R3")
> wzy_new <- matrix(wzycell,nrow = 3,ncol = 3,byrow =TRUE,dimnames = list(rnames,cnames))
> wzy_new
   C1 C2 C3
R1  6  3  2
R2  0  5  1
R3  1  4  6
> wzy_new <- matrix(wzycell,nrow = 3,ncol = 3,byrow =FALSE,dimnames = list(rnames,cnames))
> wzy_new
   C1 C2 C3
R1  6  0  1
R2  3  5  4
R3  2  1  6

#print out some elements of the matrix
> wzy_new[1,1]
[1] 6
> wzy_new[2,3]
[1] 4
```
<br> &emsp; 数据框：最常处理的数据结构。
```r
> patientID <-c(1,2,3,4)
> age <- c(25,34,28,52)
> diabetes <-c("type1","type2","type1","type1")
> status <-c("Poor","good","excellent","Poor")
> patientdata <- data.frame(patientID,age,diabetes,status)
> patientdata
  patientID age diabetes    status
1         1  25    type1      Poor
2         2  34    type2      good
3         3  28    type1 excellent
4         4  52    type1      Poor
> table(patientdata$diabetes,patientdata$status)
       
        excellent good Poor
  type1         1    0    2
  type2         0    1    0
```
* 导入数据的方法：键盘输入，从文本文件导入，从EXCEL导入，导入XML数据，从网页抓取,SPS，SASS,STATA等等
* 从Excel导入数据：读取Excel文件的最好方式就是保存为csv文件。
```r
mydata <- read.table(filename,header = TRUE,sep = "delimiter",row.names = "name")
```
* 从STATA导入数据：
```r
> library(foreign)
> mydata <- read.dta()
```
<br>至此，第二章学习暂时告一段落。下一章为图形初阶。

## 2018年4月6日 第三章：图形初阶

* R是一个惊艳的图形构建平台。 
```r
#绑定数据框
> attach(mtcars)
#弹出图形窗口，绘制图形
> plot(wt,mpg)
#添加拟合曲线
> abline(lm(mpg~wt))
#添加标题
> title("Regression of MPG on Weight")
#解绑数据框
> detach(mtcars)
```
自己尝试的：
```r
> diabetes <- read.csv("diabetes2015.csv")
> attach(diabetes)
> plot(BPAD,BPAN)
> abline(lm(BPAN~BPAD))
> title("Regression of BPAN on BPAD")
> detach(diabetes)
```

修改一些图像的参数：
<br>

```r
> dose <- c(20,30,40,45,60)
> drugA <- c(16,20,27,40,60)
> drugB <- c(15,18,25,31,40)
> plot(dose,drugA,type = "b")
#复制当前的图形参数，设置为可修改
> opar <- par(no.readonly = TRUE)
#修改折线图为虚线，将圆点改成实心三角形
> par(lty = 2, pch = 17)
> plot(dose,drugA,type = "b")
> par(opar)
```

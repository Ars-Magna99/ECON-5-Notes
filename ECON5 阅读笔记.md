2018年4月3日 Data: Cases, Variables, Samples
------------------------------------------
```r
#引入mosaic包裹
require(mosaic)
#从swim.csv文件中获取信息
swim = fetchData("swim.csv")

head(swim) #将创造的R对象反馈至屏幕
names(swim)#输出R对象含有的所有变量
summary（swim）#输出变量的一些基本参数
nrow(swim) #输出样本size
mean(year,data = swim) #输出swim中year参数的平均值
mean(swim$year) #同上
min(year,data=swim) #输出swim中year参数的最小值

swim = transform(swim,minutes = time/60) #增加一个变量

deal(kids,5) #随机获取5个样本，不重复
resample(kids,5)#随机获取kids中的5个样本，可重复
```

* if-statement in excel
```
#check the marriage status 
=IF(B2 = "1 Yes",TRUE,FALSE)
```
<br>

```
= IF(B2 = "1 Yes",TRUE,IF(B2 = "2 No",FALSE,""))
```
<br>

```
= IF(D2 > 0,D2,"")
```
<br>

```
=COUNTIFS(C5:G5,"" )
```

* 2018年4月11日 课堂笔记
```
=IFNA(IF(C2 < 60,"F",IF(C2 < 70,"D",IF(C2<80,"C",IF(C2<90,"B",IF(C2<=100,"A",""))))),"W")
```
<br>

2018年4月17日 STATA基本操作
------------------------
<br>

* If there are temporary variables you do not need in the saved file you can drop them (before saving) using ``drop`` varnames. Alternatively, you may specify the variables you want to keep, using ``keep varnames``. With large files you may want to ``compress`` them before saving; this command looks at the data and stores each variable in the smallest possible data type that will not result in loss of precision.
<br>

* variable names can have up to 32 characters, but many conmmand print only 12. Stata names are case sensitive(age ! = Age)
<br>

* ``encode`` convert string data into a numeric variable. ``decode`` convert numeric variables to string.
<br>

* If data are in free format.with variables seperated by blanks or commas, you can use the ``inflie`` command
<br>

```stata
inflie str14 country setting effort change using ///
http://略
```

<br>

* you can label your variables using ``label variable`` followed by name of variable.
<br>

* Stata has a lot of frequently used mathematical functions. use ``help mathfun``
<br>

* ``recode`` is used to group a numeric variable into catefories.
<br>

* 开启 log : `` log using 文件名 .txt, text replacing``

2018年5月20日 4.1和4.2
---------------------
<br>

* 4.1.1 loops in R

```r
results <- rep(NA,n) # create an empty container
for(i in 1:n){
results[i] <- values[i] * 2
cat(values[i],"times 2 is equal to",results[i],"\n")
}
```
<br>

* 4.1.2 Constataditional Statements
<br>

``ifelse(X,Y,Z)``  #if X is True, Y returned; if X is False, Z returned.
<br>

`` if(){} ``  and  `` if(){}else{} ``
<br>
Basic Index:
<br>

```r
# if判定代码块
if(X){
exp1
exp2
...
expN
}
```
<br>

```r
# if-else 判定代码块
if(X){
 exp1a
 exp2a
 ...
 expNa
}else{
 exp1b
 exp2b
 ...
 expNb
}
```
<br>

```r
# if-elseif-else 判定代码块
if(X){
 exp1a
 exp2a
 ...
 expNa
}else if(Y){
 exp1b
 exp2b
 ...
 expNb
}else{
 exp1c
 exp2c
 ...
 expNc
}
```
<br>

* 4.1.3 Poll Predictions
<br>

```r
pull08$margin <- pull08$obama - poll$McCain # 预测的差值
pres08$margin <- pres08$obama - pres08$McCain #实际差值
```
<br>

* 数据去重： unique()提取所有单独的取值

``st.names <- unique(polls08$state)``

<br>

* 数据的分组：tapply()
<br>

```r
tapply(flags$animate, flags$landmass, mean) #将flags$animate的数据按照flags$landmass的值进行分组，然后对各组应用mean()计算均值。
```

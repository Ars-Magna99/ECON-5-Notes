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

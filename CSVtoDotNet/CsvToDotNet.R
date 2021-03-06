library(stringr) 
fullPath<-"D:/DocumentSyncWenYu/IDE Programming Workplace/RStudioWorkplace/CSVtoDotNet" #注意，最后不带斜杠，结果文件夹dirName有待进一步指定 
fileName<-"data.csv"; #指定原始数据的.csv文件, 
resultName<-"reuslt.csv" #指定输出.csv的名称 
origin.addr<-paste(fullPath,fileName,sep="/") 
result.addr<-paste(fullPath,resultName,sep="/") 
origin.frame<-read.table(file=origin.addr, header = FALSE, sep = ",", quote="\"", dec=".", comment.char="") 
#读入数据，此时是一个数据框，第一列为行名，第二列开始，是带有列名的数据。 
origin.matrix<-as.matrix(origin.frame) 
#把原始数据转换成矩阵格式 
rn<-nrow(origin.matrix) #矩阵行数 
cn<-ncol(origin.matrix) #矩阵列数 
m<-1#设置最后输出文件的第一行行号 
result.list<-list() #设置最后输出文件的列表格式名 
for(i in 1:rn) 
{ 
  for(j in 1:cn) 
  { 
    if(origin.matrix[i,j]!="0") #直接使用str_trim会带来时间损耗 
      if(str_trim(origin.matrix[i,j])!="0") #只有当不等于零，才去除前后空格再判 
      { 
        result.list[[m]]<-as.character(i) 
        result.list[[m]][2]<-as.character(j) 
        result.list[[m]][3]<-origin.matrix[i,j]
        m<-m+1 
      } 
  } 
} 
result.matrix<-as.matrix(result.list)#最后输出文件改成矩阵，待输出 
write.csv(result.matrix, file=result.addr,row.names = FALSE)
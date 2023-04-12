library(gamlss.tr)
N=1745 #Full Sample
n=1153 #Muestras con covariables
set.seed(1234)


#En este código no habrá mucho comentario ya que está más especificado
#la manera en que se simularon los datos en el proyecto. Pero sirve
#Para ver cómo se utiliza la librería gamlss para generar
#variables aleatorias con distribuciones truncadas: el parámetro
#"NO" indica que se trata de una normal. name es el nombre que se pega a cada
#uno de los objetos generados por gen.trun. Y el vector inicial y el parámetro
#type sirven para indicar el tipo de truncamiento. Si es "both" es por ambos lados
#y por eso se ingresa un vector de dos entradas
gen.trun(c(18,25),family="NO",name="1",type="both")
Edades=as.integer(rNO1(n,21.4,2.3))


#Las variables categóricas en su mayoría se simulan como lo siguiente
ITS_o_VIH=rbinom(n,1,0.094)

cond_ultimavez=rbinom(n,1,0.876)

#De aquí en adelante todas las simulaciones son similares a las dos anteriores
#sólo que adaptando los parámetros. 
gen.trun(c(1,139),family="NO",name="1",type="both")
companeros_sex=as.integer(rNO1(n,3.2,6.1))


recien_conocido=rbinom(n,1,0.366)

pareja_estable=rbinom(n,1,0.365)

trabajador_sexual=rbinom(n,1,0.051)

estudiante=rbinom(n,1,0.461)

nivel_educativo=rbinom(n,5,3.1/5)

gen.trun(c(-0.89,2.53),family="NO",name="1",type="both")
indice_riqueza=rNO1(n,0,0.77)


Base_covariables=data.frame(cbind(Edades,ITS_o_VIH,cond_ultimavez,companeros_sex,recien_conocido,pareja_estable,trabajador_sexual,estudiante,nivel_educativo,indice_riqueza))
#La siguiente línea comentada sirve para generar la base de datos simulada en un archivo csv
#write.csv(Base_covariables,"C:\\Users\\andre\\Desktop\\Daniel .v\\Semestre 2022-1\\Proyecto I\\Covariables.csv",row.names = FALSE)

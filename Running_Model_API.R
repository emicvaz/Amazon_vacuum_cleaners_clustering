
#* @param precio
#* @param opiniones
#* @param peso
#* @param volumen
#* @param potencia
#* @param alto
#* @param ancho
#* @param profundidad
#* @get /getCluster

function(precio, opiniones, peso, volumen, potencia,alto, ancho, profundidad){
        campos<-as.vector(data[1,])
        midist<-matrix(0,ncol=8,nrow=8)
        for(i in 1:8){
                c<-dist(x=c(campos[i],mycluster$centers[,i]))
                b<-as.matrix(c)
                distancia<-b[-1,1]
                midist[i,]<-distancia
        }
        rownames(midist)<-c("Precio", "Opiniones","Peso","Volumen",
                            "Potencia","Alto","Ancho","Profundidad")
        dist_total<-apply(midist,2,sum)
        num_cluster<-which.min(dist_total)
        num_cluster
}

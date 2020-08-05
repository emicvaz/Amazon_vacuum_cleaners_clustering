aspiradoras <- load(file = "aspiradoras.RData")
aspiradoras<-as.data.frame(resultado)

#Procesado de peso

aspiradoras$`Peso del producto`<-as.character(aspiradoras$`Peso del producto`)
aspiradoras$`Peso del producto`<-gsub("Kg","",aspiradoras$`Peso del producto`)
aspiradoras$`Peso del producto`<-gsub(",",".",aspiradoras$`Peso del producto`)
aspiradoras$`Peso del producto`<-gsub("-1",NA,aspiradoras$`Peso del producto`)
#Aqui cosas que pesaban menos de un kilo les pusiste el peso medio.
#Tache pero es un bosquejo
aspiradoras$`Peso del producto`<-as.numeric(aspiradoras$`Peso del producto`)
promedio<-mean(aspiradoras$`Peso del producto`,na.rm = TRUE)
aspiradoras$`Peso del producto`[is.na(aspiradoras$`Peso del producto`)]<-promedio

hist(aspiradoras$`Peso del producto`)

#Volumen
aspiradoras$Volumen<-as.character(aspiradoras$Volumen)
aspiradoras$Volumen<-gsub("litros","",aspiradoras$Volumen)
aspiradoras$Volumen<-gsub("-1",NA,aspiradoras$Volumen)
#Aqui cosas que pesaban menos de un kilo les pusiste el peso medio.
#Tache pero es un bosquejo
aspiradoras$Volumen<-as.numeric(aspiradoras$Volumen)
volumen_promedio<-mean(aspiradoras$Volumen,na.rm = TRUE)
aspiradoras$Volumen[is.na(aspiradoras$Volumen)]<-promedio
hist(aspiradoras$Volumen)

#Siguiente parametro numero de opiniiones
str(aspiradoras$Opiniones)
#Convertimos a char para procesar
aspiradoras$Opiniones<-as.character(aspiradoras$Opiniones)
aspiradoras$Opiniones<-gsub("opiniones de clientes", "", aspiradoras$Opiniones)
aspiradoras$Opiniones<-gsub("opinión de cliente", "", aspiradoras$Opiniones)
aspiradoras$Opiniones<-gsub("valoraciones", "", aspiradoras$Opiniones)
aspiradoras$Opiniones<-gsub(",", "", aspiradoras$Opiniones)
aspiradoras$Opiniones<-as.numeric(aspiradoras$Opiniones)
aspiradoras$Opiniones[is.na(aspiradoras$Opiniones)] <- mean(aspiradoras$Opiniones, na.rm = TRUE)
hist(aspiradoras$Opiniones)
boxplot(aspiradoras$Opiniones)

#Siguiente parametro numero de precio
str(aspiradoras$Precio)
#Convertimos a char para procesar
aspiradoras$Precio<-as.character(aspiradoras$Precio)
aspiradoras$Precio<-gsub("EUR", "", aspiradoras$Precio)
aspiradoras$Precio<-gsub("€", "", aspiradoras$Precio)
aspiradoras$Precio<-gsub(",", ".", aspiradoras$Precio)
#Eliminamos el ultimo character
aspiradoras$Precio<-str_sub(aspiradoras$Precio, 1, str_length(aspiradoras$Precio)-1)
aspiradoras$Precio<-as.numeric(aspiradoras$Precio)
aspiradoras$Precio[is.na(aspiradoras$Precio)] <- mean(aspiradoras$Precio, na.rm = TRUE)
hist(aspiradoras$Precio)
boxplot(aspiradoras$Precio)

str(aspiradoras$Potencia)
#Convertimos a char para procesar
aspiradoras$Potencia<-as.character(aspiradoras$Potencia)
aspiradoras$Potencia<-gsub("watt_hours", "", aspiradoras$Potencia)
aspiradoras$Potencia<-gsub("vatios", "", aspiradoras$Potencia)
aspiradoras$Potencia<-gsub("-1", NA, aspiradoras$Potencia)
aspiradoras$Potencia<-as.numeric(aspiradoras$Potencia)
pmean<-mean(aspiradoras$Potencia, na.rm = TRUE)
aspiradoras$Potencia[is.na(aspiradoras$Potencia)] <- pmean
 
#Dimensiones
aspiradoras$`Dimensiones del producto`<-as.character(aspiradoras$`Dimensiones del producto`)
aspiradoras$`Dimensiones del producto`<-gsub("cm", "", aspiradoras$`Dimensiones del producto`)
aspiradoras$`Dimensiones del producto`<-gsub(",", ".", aspiradoras$`Dimensiones del producto`)
dimen<-str_split_fixed(aspiradoras$`Dimensiones del producto`,"x", n=3)
colnames(dimen) <- c("Alto","Ancho","Profundidad")
dimen <- as.data.frame(dimen)

dimen$Alto<-gsub("-1", NA, dimen$Alto)
dimen$Ancho<-gsub("-1", NA, dimen$Ancho)
dimen$Profundidad<-gsub("-1", NA, dimen$Profundidad)

dimen$Alto<-as.numeric(dimen$Alto)
dimen$Ancho<-as.numeric(dimen$Ancho)
dimen$Profundidad<-as.numeric(dimen$Profundidad)

alto_media<-mean(dimen$Alto, na.rm = TRUE)
dimen$Alto[is.na(dimen$Alto)] <- alto_media

ancho_media<-mean(dimen$Ancho, na.rm = TRUE)
dimen$Ancho[is.na(dimen$Ancho)] <- ancho_media

profundidad_media<-mean(dimen$Profundidad, na.rm = TRUE)
dimen$Profundidad[is.na(dimen$Profundidad)] <- profundidad_media


res_limpio<-cbind(aspiradoras, dimen)
res_limpio_f<-res_limpio[,-3]


save(res_limpio_f,file = "/Users/emilianocaballero/Cursos/Platzi/aspiradoras_final.RData")


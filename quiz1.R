library(readr)
data<-read_csv("hw1_data.csv")
colnames(data) # Kolon adları

first_two_row=head(data,n=2) # İlk 2 satır
first_two_row
last_two_row=tail(data,n=2) # Son 2 satır
last_two_row

data[47,"Ozone"] # 47. satır Ozone kolonu degeri 

colSums(is.na(data)) #Kolon bazlı na sayısı

summary(data)

# Assuming your data frame is named df
subset_data <- data[data$Ozone > 31 & data$Temp > 90, ]
mean_solar_r <- mean(subset_data$Solar.R,na.rm = TRUE)
print(mean_solar_r)

#What is the mean of "Temp" when "Month" is equal to 6?
subset_data<-data[data$Month==6,]
mean_temp<-mean(subset_data$Temp,na.rm = TRUE)
print(mean_temp)

#What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
subset_data<-data[data$Month==5,"Ozone"]
max_ozone<-max(subset_data,na.rm=TRUE)
max_ozone

summary(subset_data)

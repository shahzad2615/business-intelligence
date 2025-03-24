Practical: 3 
Aim: Perform the data classification using classification algorithm using 
R/Python. 
Code: 
 
rainfall <-c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071) 
rainfall.timeseries <- ts(rainfall,start = c(2012,1),frequency = 12) 
print(rainfall.timeseries) 
png(file = "rainfall.png") 
plot(rainfall.timeseries) 
dev.off()



 pract 4 Aim:Perform the data clustering using clustering algorithm using 
R/Python. 
Code: 
 
library(party) 
print(head(readingSkills)) 
input.dat <- readingSkills[c(1:105),] 
png(file = "decision_tree.png") 
output.tree <- ctree(nativeSpeaker ~ age + shoeSize + score,data = input.dat) 
plot(output.tree) 
dev.off() 




Practical: 5 
Aim: Perform the Linear regression on the given data warehouse data 
using R/Python. 
Code: 
 
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131) 
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48) 
# Apply the lm() function to create a linear regression model 
relation <- lm(y ~ x) 
# Print the model summary 
print(summary(relation)) 
# Predict the weight of a person with height 170 
a <- data.frame(x = 170) 
result <- predict(relation, a) 
print(result) 
# Visualizing the Regression Graphically 
png(file = "linearregression.png") 
plot(x, y, col = "blue", main = "Height & Weight Regression", 
     xlab = "Height in cm", ylab = "Weight in Kg", pch = 16) 
abline(relation, col = "red") 
dev.off()



prac 6





Aim: Perform the logistic regression on the given data warehouse data 
using R/Python. 
Code: 
 
# Load necessary libraries 
library(dplyr) 
library(titanic) 
library(pROC) 
 
# Load Titanic dataset 
data("titanic_train") 
 
# Check dataset structure 
head(titanic_train) 
 
# Data Cleaning: Removing rows with missing values 
titanic_clean <- titanic_train %>% 
  filter(!is.na(Age), !is.na(Embarked), !is.na(Sex), !is.na(Pclass)) 
 
# Convert categorical variables to factors 
titanic_clean$Survived <- as.factor(titanic_clean$Survived) 
titanic_clean$Pclass <- as.factor(titanic_clean$Pclass) 
titanic_clean$Sex <- as.factor(titanic_clean$Sex) 
titanic_clean$Embarked <- as.factor(titanic_clean$Embarked) 
 
# Build Logistic Regression Model 
model <- glm(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked,  
             data = titanic_clean, family = binomial) 
 
# Print model summary 
summary(model) 
 
28 | Page 
 
# Predict probabilities 
predictions <- predict(model, type = "response") 
 
# Convert probabilities to binary classification 
predictions_class <- ifelse(predictions > 0.5, 1, 0) 
 
# Evaluate Model Accuracy 
confusion_matrix <- table(Predicted = predictions_class, Actual = 
titanic_clean$Survived) 
print(confusion_matrix) 
 
accuracy <- mean(predictions_class == as.numeric(titanic_clean$Survived) - 1) 
print(paste("Accuracy:", accuracy)) 
 
# ROC Curve 
roc_curve <- roc(as.numeric(titanic_clean$Survived) - 1, predictions) 
plot(roc_curve, main = "ROC Curve")



import pandas as pd 
file_path = 'data.csv' 
data = pd.read_csv(file_path) 
print("First 5 rows of the dataset:") 
print(data.head()) 
print("\nDataset Information:") 
print(data.info()) 
print("\nSummary Statistical:") 
print(data.describe()) 
if 'Category' in data.columns: 
print("\nUnique values in 'Category' column:") 
print(data['Category'].value_counts())



Practical: 8a 
Aim: Perform data visualization using python on any sales data. 
 
Code: 
import pandas as pd 
import matplotlib.pyplot as plt 
import seaborn as sns 
data = { 
'Data': pd.date_range(start='2023-01-01', periods=100, freq='D'), 
'Product': ['Product A', 'Product B', 'Product C', 'Product D']* 25, 
'Category': ['Electronics', 'Furniture', 'Clothing', 'Books']* 25, 
'Region': ['North', 'South', 'East', 'West']* 25, 
'Sales': [x * 10 for x in range(100)], 
'Profit': [x * 2 for x in range(100)], 
} 
df = pd.DataFrame(data) 
print(df.head()) 
plt.figure(figsize=(10, 5)) 
sns.lineplot(data=df, x='Data', y='Sales', marker='o') 
plt.title('Sales Trend Over Time') 
plt.xlabel('Data') 
plt.ylabel('Sales') 
plt.grid(True) 
plt.show() 
plt.figure(figsize=(8, 5)) 
sns.barplot(data=df, x='Category', y='Sales', ci=None, palette='viridis') 
plt.title('Sales by Category') 
plt.xlabel('Category') 
plt.ylabel('Total Sales') 
plt.show() 
plt.figure(figsize=(8, 5)) 
sns.boxplot(data=df, x='Region', y='Profit', palette='coolwarm') 
plt.title('Profit Distribution by Region') 
plt.xlabel('Region') 
plt.ylabel('Profit') 
plt.show() 
plt.figure(figsize=(8, 5)) 
product_sales = df.groupby('Product')['Sales'].sum().reset_index() 
sns.barplot(data=product_sales, x='Product', y='Sales', palette='magma') 
plt.title('Total Sales by Product') 
plt.xlabel('Product') 







Practical: 9 
Aim: Create the Data staging area for the selected database using SQL 
 
STEPS:-  
Step 1:- Create a Staging Database First, create a staging database to store 
raw sales data.  
CREATE DATABASE Sales_Staging;  
USE Sales_Staging;  
Step 2:- Create Staging Tables Create tables that match the structure of raw 
sales data but include additional fields like load date and batch ID.  
CREATE TABLE Staging_Sales (  
SalesID INT PRIMARY KEY,  
OrderDate DATE,  
ProductName VARCHAR(100),  
Category VARCHAR(50),  
Region VARCHAR(50),  
SalesAmount DECIMAL(10,2),  
Profit DECIMAL(10,2),  
Quantity INT,  
LoadDate DATETIME DEFAULT CURRENT_TIMESTAMP,  
BatchID INT );

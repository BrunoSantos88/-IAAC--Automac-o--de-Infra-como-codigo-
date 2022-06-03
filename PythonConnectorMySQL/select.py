# importing required libraries
import mysql.connector
 
mydb  = mysql.connector.connect(
      host="testedb.cghgqbvfm4sf.us-east-1.rds.amazonaws.com",
      user="Admin",
      passwd="*Mulekao1988*",
      database="seconddabase"

)

mycursor = mydb.cursor()

mycursor.execute("SELECT name, address FROM customers")

myresult = mycursor.fetchall()

for x in myresult:
  print(x)
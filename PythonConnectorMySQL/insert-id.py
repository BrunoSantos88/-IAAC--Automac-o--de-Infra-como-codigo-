# importing required libraries
import mysql.connector
 
mydb  = mysql.connector.connect(
      host="testedb.cghgqbvfm4sf.us-east-1.rds.amazonaws.com",
      user="Admin",
      passwd="*Mulekao1988*",
      database="seconddabase"

)

mycursor = mydb.cursor()

sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
val = ("Michelle", "Blue Village")
mycursor.execute(sql, val)

mydb.commit()

print("1 record inserted, ID:", mycursor.lastrowid)
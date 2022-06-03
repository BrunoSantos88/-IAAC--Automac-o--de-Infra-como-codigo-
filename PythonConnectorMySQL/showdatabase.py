# importing required libraries
import mysql.connector
 
dataBase = mysql.connector.connect(
      host="testedb.cghgqbvfm4sf.us-east-1.rds.amazonaws.com",
      user="Admin",
      passwd="*Mulekao1988*",

)
# preparing a cursor object
cursorObject = dataBase.cursor()
 
# creating database
cursorObject.execute("SHOW DATABASES")

for x in cursorObject:
  print(x)
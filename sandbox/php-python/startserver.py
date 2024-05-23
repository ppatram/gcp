#!/usr/bin/python3

import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="test",
  database="gcp_usage"

)

mycursor = mydb.cursor()

mycursor.execute("select * from persons;")


#(1, 'AYAN', 'BHADURI', 'abhaduri', 'GEW3963B25E0', 'notprov')
for x in mycursor:
    login = x[3]

    try:
        statfile = "/var/lib/docker/volumes/docker-lamp_php/_data/tmp/%s"%login
        fname = open(statfile, "r")
        line = fname.read()
        fname.close()
        parts = line.split(',')
        status = parts[5]
        print("Login: %s Stat: %s"%(login,status))
    except:
       print("User %s is not present"%login)
       continue




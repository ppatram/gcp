#!/usr/bin/python3

import mysql.connector
import subprocess


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="test",
  database="gcp_usage"

)

mycursor = mydb.cursor()

mycursor.execute("select * from persons;")


## id | firstname   | lastname | login    | accesscode   | zone        | serverip
for x in mycursor:
    login = x[3]
    zone = x[5]

    try:
        statfile = "/var/lib/docker/volumes/docker-lamp_php/_data/tmp/%s"%login
        fname = open(statfile, "r")
        line = fname.read()
        fname.close()
        parts = line.split(',')
        status = parts[5]
        print("Login: %s Region: %s"%(login,zone))
        subprocess.run(["/var/lib/docker/volumes/docker-lamp_php/_data/gcp.sh", login, zone])
    except:
       continue




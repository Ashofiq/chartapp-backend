import config
import mysql.connector

class Database():
    db_config = {
        'user': config.DB_USER,
        'password': config.DB_PASS,
        'host': config.DB_HOST,
        'database': config.DB_NAME
    }

    # Connect to the database
    cnx = mysql.connector.connect(**db_config)
    cursor = cnx.cursor(dictionary=True)
        

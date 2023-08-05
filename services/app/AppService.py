from database.Database import Database 
import mysql.connector
import config

class AppService(Database):
    def __init__(self):
        self.name = ''

    def appInfo(self, appId): 
          # return data
        query = ("SELECT * FROM apps where id='{}'".format(appId))
        # return query
        Database.cursor.execute(query)
        rows = Database.cursor.fetchone()
        return rows
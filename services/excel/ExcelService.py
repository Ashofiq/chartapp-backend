import pandas as pd
from services.app.AppService import AppService

class ExcelService():
    def __init__(self, app):
        self.path = self.get_file_path()
        self.app = app

    async def read_data(self, header_data=None):
        data = None
        if header_data:
            if  self.app['type'] == 'excel':
                read = pd.read_excel(self.app['file'], nrows=0)
                data = read.columns.tolist()
            elif self.app['type'] in ['csv', 'googleSheet']:
                read = pd.read_csv(self.app['file'], nrows=0)
                data = read.columns.tolist()
        else:
            if self.app['type'] == 'excel':
                data = pd.read_excel(self.app['file'])
            elif self.app['type'] in ['csv', 'googleSheet']:
                data = pd.read_csv(self.app['file'])
        
        return data
    
    def get_file_path(self):
        return 'static/Sales.xlsx'
        return 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQz44mwVMFs-nPVy_ILWATJATmQU6Lrfhe9jYEBmGQRltl7vJBlw8FimGNyxWepjeX3Gs25J00-krgA/pub?output=csv'
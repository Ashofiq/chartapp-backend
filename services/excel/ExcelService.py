import pandas as pd

class ExcelService():
    def __init__(self, appId):
        self.path = self.get_file_path()
        self.appId = appId

    async def read_excel(self, header_data=None):
        data = None
        if header_data:
            read = pd.read_excel(self.path, nrows=0)
            data = read.columns.tolist()
        else:
            data = pd.read_excel(self.path)

        return data
    
    def get_file_path(self):
        return 'static/Sales.xlsx'


from models.app import App 
from services.excel.ExcelService import ExcelService 
from fastapi.responses import JSONResponse
import pandas as pd
import asyncio

class DataService():
    def __init__(self, appId):
        self.appId = appId
        self.appInfo = self.get_app_info()
        self.excelService = ExcelService(self.appId)

    async def get_header(self):
        appId = self.appId
        return await self.header_data()
    
    async def analize(self, request):
        data = None
        if self.app['appType'] == 'flatfile':
            data = await self.excelService.read_excel()
            # df = pd.DataFrame(data, columns=request['yAxis'])
            # data = pd.DataFrame(df)
            # data = data.groupby(request['yAxis']).median()

            df = pd.DataFrame(data)
            df = df[request['yAxis']]
            n = df.groupby(request['yAxis']).count()

       
        # Create a DataFrame with some data
        df = pd.DataFrame(data)

        # Group the DataFrame by the 'Category' column and include it in the result
        grouped = df.groupby(request['yAxis']).apply(lambda x: pd.Series({'Count': len(x)}))

        print(grouped)
        return grouped.to_json()
            
    async def header_data(self):
        # check apptype 
        if self.app['appType'] == 'flatfile':
            data = await self.excelService.read_excel(header_data=True)
        return data
    
    def get_app_info(self):
        # get app info from database
        app = {
            'appId': self.appId,
            'title': 'Sale Excel',
            'appType': 'flatfile' # mysql,google analytics, google sheet etc
        }
        self.app = app


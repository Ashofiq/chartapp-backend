from models.app import App 
from services.excel.ExcelService import ExcelService 
from services.AnalizeService import AnalizeService 
from services.app.AppService import AppService

class DataService():
    def __init__(self, appId):
        self.appId = appId
        self.app = self.get_app_info()
        self.analizeService = AnalizeService(self.appId)

    async def get_header(self):
        headers = await self.header_data()
        data = []
        for element in headers:
            data.append({
                'name': element,
                'aggr': None,
                'field': element,
                'customAggr': None
            })
        
        return data
    
    async def header_data(self):
        # check apptype 
        excelService = ExcelService(await self.get_app_info())
        data = await excelService.read_data(header_data=True)
        return data
    
    async def analize(self, request):
        data = await self.getData()
        analizeData = await self.dataAnalize(data, request)
        return analizeData

    async def getData(self):
        app = await self.get_app_info()
        data = []
        if  app['type'] == 'excel':
            excelService = ExcelService(app)
            data = await excelService.read_data()
        elif app['type'] in ['csv', 'googleSheet']:
            excelService = ExcelService(app)
            data = await excelService.read_data()

        return data
        
    
    async def dataAnalize(self,data, request):
        final = ''
        if request['selectedChart'] in ['barChart', 'pieChart']:
            data1 = await self.analizeService.groupByAndCount(request, data)
            final = data1.to_json()
        elif request['selectedChart'] == 'count':
            aggr = request['rawData']['yAxis']
            final = await self.analizeService.groupByThenAggr(aggr, request, data)
        elif request['selectedChart'] == 'areaChart':
            data1 = await self.analizeService.groupByAndSum(request, data)
            final = data1.to_json()
        elif request['selectedChart'] == 'basicColumn':
            data1 = await self.analizeService.groupByBasicColumn(request, data)
            final = data1
            print(data1)
        return final
    
    async def get_app_info(self):
        appService = AppService()
        # print(appService.appInfo(self.appId))
        app = appService.appInfo(self.appId)
        return app

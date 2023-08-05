import pandas as pd
import numpy as np
import datetime

class AnalizeService():
    def __init__(self, appId):
        self.appId = appId

    async def dataFrame(self, data, request):
        # return pd.DataFrame(data)
        df = pd.DataFrame(data)
        print(request['rawData']['filterDate']['fromDate'])
        if request['filterBy']:
            if request['rawData']['filterDate']['fromDate'] != None and request['rawData']['filterDate']['toDate'] != None:
                fromDate= datetime.datetime.strptime(request['rawData']['filterDate']['fromDate'], '%Y-%m-%d').strftime('%d-%m-%Y')
                toDate= datetime.datetime.strptime(request['rawData']['filterDate']['toDate'], '%Y-%m-%d').strftime('%d-%m-%Y')
                df = df[df[request['filterBy'][0]].between(fromDate, toDate)]

        return df

    async def groupByAndCount(self, request, data):
        # Create a DataFrame with some data
        df = await self.dataFrame(data, request) #pd.DataFrame(data)

        # Group the DataFrame by the request['yAxis'] column and include it in the result
        grouped = df.groupby(request['yAxis'])[request['yAxis']].count()

        return grouped
    
    async def groupByAndSum(self, request, data):
        # Create a DataFrame with some data
        df = await self.dataFrame(data, request) #pd.DataFrame(data)

        # Group the DataFrame by the request['yAxis'] column and include it in the result
        grouped = df.groupby(request['xAxis'])[request['yAxis']].sum()

        return grouped
    
    async def groupByBasicColumn(self, request, data):
        # Create a DataFrame with some data
        df = await self.dataFrame(data, request) #pd.DataFrame(data)

        grouped = df.groupby(request['xAxis'])[request['yAxis']].sum().apply(list).reset_index().to_dict('records')

        for d in grouped:
            print(d, request['xAxis'][0])
            d['name'] = d.pop(request['xAxis'][0])
            d['data'] = [d.pop(request['yAxis'][0])]

        return grouped
    
    async def groupByThenAggr(self, aggr, request, data):
        # Create a DataFrame with some data
        df = await self.dataFrame(data, request)

        return await self.aggrProcess(aggr, df)
    
    async def aggrProcess(self, aggr, df):
        grouped = list()
        for item in aggr:
            if item['aggr'] == 'count':
                count = df.groupby(item['field'])[item['field']].apply(np.array)
                grouped.append({'name':item['name'], 'value':len(count)})

            if item['aggr'] == 'sum':
                sum = df[item['field']].sum()
                grouped.append({'name': item['name'], "value": int(sum)})
            
            if item['aggr'] == 'average':
                mean = df[item['field']].mean()
                grouped.append({'name': item['name'], "value": int(mean)})

            if item['customAggr'] != None:
                custom = df.eval(item['customAggr'], target=df)
                grouped.append({'name': item['name'], "value": str(custom)})
                
        return grouped
            

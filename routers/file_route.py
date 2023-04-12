from fastapi import APIRouter,Request, Body
from fastapi.responses import JSONResponse
from services.DataService import DataService 

router = APIRouter()

@router.post("/api/v1/fieldlist")
async def get_header(request:Request):
    data = await request.json()
    dataService = DataService(appId=1)
    return await dataService.get_header() 


@router.post("/api/v1/analize")
async def analize(request: object = Body(...)):
    dataService = DataService(appId=request['appId'])
    return await dataService.analize(request) 
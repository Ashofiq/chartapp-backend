from fastapi import APIRouter,Request, Body,  File, Form, UploadFile
from fastapi.responses import JSONResponse
from services.DataService import DataService 
from services.app.AppService import AppService
import mysql.connector
import os
import json

router = APIRouter()


db_config = {
    'user': 'root',
    'password': '',
    'host': 'localhost',
    'database': 'vuexy'
}

# Connect to the database
cnx = mysql.connector.connect(**db_config)
cursor = cnx.cursor(dictionary=True)

@router.post("/api/v1/fieldlist")
async def get_header(request: object = Body(...)):
    dataService = DataService(appId=request['appId'])
    return await dataService.get_header() 


@router.post("/api/v1/analize")
async def analize(request: object = Body(...)):
    dataService = DataService(appId=request['appId'])
    return await dataService.analize(request) 


# app curl
@router.post("/api/v1/app")
async def createApp( 
    name: str = Form(...),
    type: str = Form(...),
    file: UploadFile = File(None),
    googleSheetUrl: str = Form(...),
    request: Request = Request
):
    fn = os.path.basename(file.filename)
    if not file.file: 
        return
    open('tmp/' + fn, 'wb').write(file.file.read())
    fullpath = 'tmp/'+fn
    query = ("INSERT INTO apps (userId, name, type, file, googleSheetUrl) VALUES ({}, '{}', '{}', '{}', '')".format(request.state.user_id, name, type, fullpath, googleSheetUrl))
    cursor.execute(query)
    cnx.commit()
    return "Successfully create"

@router.post("/api/v1/app/update")
async def updateApp( 
    name: str = Form(...),
    type: str = Form(...),
    file: UploadFile = File(None),
    googleSheetUrl: str = Form(None),
    appId: int = Form(...),
    request: Request = Request
):
    
    fullpath = ''
    if file != None: 
        fn = os.path.basename(file.filename)
        if fn != '':
            open('tmp/' + fn, 'wb').write(file.file.read())
            fullpath = 'tmp/'+fn

    if googleSheetUrl:
        fullpath = googleSheetUrl

    query = ("UPDATE apps set name = '{}', type = '{}', file = '{}' where id = {}".format(name, type, fullpath, appId))
    cursor.execute(query)
    cnx.commit()
    return "Successfully update"

@router.get("/api/v1/app")
async def allApp(request: Request):
    query = ("SELECT * from apps where userId = {}".format(request.state.user_id))
    cursor.execute(query)
    rows = cursor.fetchall()
    return rows


@router.post("/api/v1/save-visual-items")
async def allApp(request: object = Body(...)):
    if request == None:
        return False
    app = AppService.appInfo('',request['appId'])
    # return app['visualItems']
    visualitem = json.loads(str([]) if app['visualItems'] in [None, []] else app['visualItems'])
    # visualitem = json.loads(app['visualItems'])
    for item in visualitem:
        if item['visualItem']['id'] == request['visualItem']['id']:
            visualitem.remove(item)  
    
    visualitem.append(request)  
    # return visualitem
    query = "UPDATE apps SET visualItems = '{}' WHERE id = {}".format(json.dumps(visualitem), request['appId'])
    cursor.execute(query)
    cnx.commit()
    return AppService.appInfo('',request['appId'])
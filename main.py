from typing import Union
import time
import jwt
import mysql.connector
from fastapi import FastAPI, Request, HTTPException
from fastapi.responses import JSONResponse
from JWTAuthenticationMiddleware import JWTAuthenticationMiddleware
from passlib.hash import sha256_crypt
from fastapi.middleware.cors import CORSMiddleware
from routers.file_route import router as file_route
import config

app = FastAPI()

app.include_router(file_route)
app.add_middleware(JWTAuthenticationMiddleware)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}

db_config = {
    'user': 'root',
    'password': '',
    'host': 'localhost',
    'database': 'vuexy'
}

# Connect to the database
cnx = mysql.connector.connect(**db_config)
cursor = cnx.cursor(dictionary=True)


# Define an API endpoint that performs a SELECT query
@app.get("/users")
async def get_users():
    query = ("SELECT * FROM users where email")
    cursor.execute(query)
    rows = cursor.fetchall()
    return rows[0]

# Define an API endpoint that generates a JWT for a user
@app.post("/login")
async def login(request: Request):
    data = await request.json()
    userdata = await user(data)
    # return {'userdata': userdata}

    if userdata is None:
        return JSONResponse(status_code=201, content={"message":"Email or Password wrong"})

    if sha256_crypt.verify(str(data['password']), str(userdata['password'])) == False:
        return JSONResponse(status_code=201, content={"message":"Email or Password wrong"})

    # Generate a JWT
    payload = {"id": userdata['id'], "email": data['email'], "password": data['password']}
    token = jwt.encode(payload, config.SECRET_KEY, config.ALGORITHM)

    return JSONResponse(status_code=200, content={"token":token})


async def user(data):
    # return data
    query = ("SELECT * FROM users where email='{}'".format(data['email']))
    # return query
    cursor.execute(query)
    rows = cursor.fetchone()
    return rows

# Define a protected API endpoint that requires a valid JWT
@app.post("/v1/api/me")
async def protected(request: Request):
    return {"id": request.state.user_id, "email": request.state.email, "name": '' }

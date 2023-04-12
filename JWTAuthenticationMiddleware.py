from fastapi import FastAPI, HTTPException, Depends
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from starlette.middleware.base import BaseHTTPMiddleware
from fastapi.responses import JSONResponse
from typing import Optional
import jwt
import config

app = FastAPI()

# Define a security scheme using JWT
bearer_scheme = HTTPBearer()

# Secret key for JWT token decoding
SECRET_KEY = "your_secret_key"

# Custom authentication middleware class
class JWTAuthenticationMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request, call_next):
        if request.url.path == "/login":
            response = await call_next(request)
            return response
        else:
            token = request.headers.get('Authorization')
            if token is None:
                return JSONResponse(status_code=401, content={"message":"Token Not Found"})

            # Verify the token and set the user information in the request state
            try:
                if token:
                    payload = jwt.decode(token, config.SECRET_KEY, config.ALGORITHM)
                    user_id = payload.get("id")
                    if user_id is None:
                        return JSONResponse(status_code=401, content={"message":"UnAuthenticate"})

                    request.state.user_id = user_id
                    request.state.email = payload.get("email")
            except jwt.InvalidSignatureError as er:
                return JSONResponse(status_code=401, content={"message":"UnAuthenticate"})
            
            # Call the next middleware or route handler
            response = await call_next(request)
            return response

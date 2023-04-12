import jwt
from fastapi import FastAPI, HTTPException, APIRouter

router = APIRouter()

# Define a secret key for signing and verifying JWTs
SECRET_KEY = "your_secret_key"

# Define an API endpoint that generates a JWT for a user
@router.post("/login")
async def login(username: str, password: str):
    # Verify the user's credentials
    # ...

    # Generate a JWT
    payload = {"username": username, "password": password}
    token = jwt.encode(payload, SECRET_KEY)

    return {"token": token}

# Define a helper function to verify JWTs
def verify_token(token):
    try:
        payload = jwt.decode(token, SECRET_KEY)
        return payload
    except:
        raise HTTPException(status_code=401, detail="Invalid token")

# Define a protected API endpoint that requires a valid JWT
@router.get("/protected")
async def protected(token: str):
    payload = verify_token(token)
    return {"message": "Hello, {}".format(payload['username'])}

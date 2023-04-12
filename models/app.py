from pydantic import BaseModel

class App(BaseModel):
    appId: int
    title: str
    appType: str
    
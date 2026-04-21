from pydantic import BaseModel
from typing import List


class A(BaseModel):
    name: str


class B(BaseModel):
    items: List[A]


B.model_rebuild()
print(B.model_json_schema())
print("Test passed")

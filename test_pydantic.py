from pydantic import BaseModel


class A(BaseModel):
    name: str


class B(BaseModel):
    items: list[A]


B.model_rebuild()
print(B.model_json_schema())
print("Test passed")

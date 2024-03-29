import os

import fastapi
import prometheus_client
import uvicorn
from starlette.requests import Request

api = fastapi.FastAPI()

REQUESTS = prometheus_client.Counter(
    "requests", "Application Request Count", ["endpoint"]
)


@api.get("/")
def index(request: Request):
    REQUESTS.labels(endpoint="/").inc()
    return "Hello World"


@api.get("/metrics")
def metrics():
    return fastapi.responses.PlainTextResponse(prometheus_client.generate_latest())


if __name__ == "__main__":
    print("Starting webserver...")
    uvicorn.run(
        api,
        host="0.0.0.0",
        port=int(os.getenv("PORT", 8080)),
        debug=os.getenv("DEBUG", False),
        log_level=os.getenv("LOG_LEVEL", "info"),
        proxy_headers=True,
    )

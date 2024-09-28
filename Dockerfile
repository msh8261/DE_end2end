FROM python:3.9-slim

WORKDIR /app

RUN pip install pytest

CMD ["pytest", "--version"]

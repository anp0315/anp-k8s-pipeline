FROM python:3.11-slim

WORKDIR /app

RUN pip install robotframework

COPY . .

CMD ["robot", "tests"]
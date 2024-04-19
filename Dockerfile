FROM python:3.12

ENV PYTHONUNBUFFERED True

WORKDIR /app
COPY ./src/ ./

RUN pip install -r requirements.txt

CMD [ "python",  "-m", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080" ]
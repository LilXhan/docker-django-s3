FROM python:3.11-slim

# Instalar las dependecias para linux

RUN apt update && apt install -y \ 
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# RUN mkdir /app

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install  --no-cache-dir --upgrade -r requirements.txt

COPY . /app/

ENV PYTHONPATH = /app 

EXPOSE 8000 

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



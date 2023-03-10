FROM python:3
ARG VERSION=""
ARG SECRET_KEY=""
ENV SECRET_KEY="secret"
ENV VERSION=${VERSION}
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
EXPOSE 8000
CMD sh init.sh && python3 manage.py runserver 0.0.0.0:8000
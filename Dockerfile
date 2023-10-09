FROM python:3.8.2-buster
RUN apt-get update
RUN python3 -m venv /venv
ENV PATH=/venv/bin:$PATH
RUN pip3 install --upgrade pip
LABEL org.opencontainers.image.authors="Rajesh Thakur rajeshthakur1r@gmail.com"
COPY . /opt
WORKDIR /opt
RUN apt-get update
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install gunicorn
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
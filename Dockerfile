FROM alpinelinux/build-base

USER root
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install flask

COPY app/app.py /opt/app.py
RUN chmod +x /opt/app.py

USER buildozer
WORKDIR /opt

ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
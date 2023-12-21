FROM python

WORKDIR /workspace

ADD . /workspace

RUN pip install -r requirements.txt

COPY main_gen/py .
COPY painter.py .
COPY utils.py .

CMD [ "python" , "/workspace/app.py" ]

RUN chown -R 42420:42420 /workspace

ENV HOME=/workspace
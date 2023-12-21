FROM python

RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx \
                       libglib2.0-0 \
                       libxrender1 \
                       libxkbcommon-x11-0

WORKDIR /workspace

ADD . /workspace

COPY main_gen.py /workspace
COPY painter.py /workspace
COPY utils.py /workspace

RUN pip install -r requirements.txt

RUN chown -R 42420:42420 /workspace

ENV LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
ENV QT_PLUGIN_PATH=/usr/lib/x86_64-linux-gnu/qt5/plugins

CMD ["bash", "-c", "export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH && python /workspace/app.py --platform xcb"]

ENV HOME=/workspace

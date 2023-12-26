FROM python:3.8-slim-buster

# Install necessary system packages
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx libglib2.0-0 libxkbcommon-x11-0 libfontconfig1 && \
    rm -rf /var/lib/apt/lists/*

# Set Qt environment variables
ENV QT_DEBUG_PLUGINS=1
ENV QT_XCB_GL_INTEGRATION=xcb_egl

WORKDIR /app

COPY main_gen.py .
COPY painter.py .
COPY utils.py .
COPY requirements.txt .

RUN pip3 install -r requirements.txt

# Copy the source code into the container.
COPY . .

# Expose the port that the application listens on.
EXPOSE 5000

# Run the application.
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]

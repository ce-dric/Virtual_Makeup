# Use the official Anaconda3 image as a base
FROM continuumio/anaconda3:latest

WORKDIR /workspace

COPY environment4docker.yml /workspace/environment.yml

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

RUN conda env create -f /workspace/environment.yml

SHELL ["conda", "run", "-n", "virtual_makeup", "/bin/bash", "-c"]

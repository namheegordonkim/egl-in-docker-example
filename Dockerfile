# Take a look at Dockerfiles in
# https://gitlab.com/nvidia/container-images/opengl
# if you want to use another image (e.g. CUDA + CuDNN) and enable OpenGL
# FROM nvidia/opengl:1.2-glvnd-runtime-ubuntu20.04
FROM nvidia/opengl:1.2-glvnd-runtime-ubuntu22.04

# fontconfig specifically for vispy
RUN apt-get update && apt-get install -y wget fontconfig mesa-utils

# Install Miniconda 3. Note /opt/miniconda3 will have libstdc++.so.6, which we override in entrypoint.
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
&& bash miniconda.sh -b -u -p /opt/miniconda3 
ENV PATH=/opt/miniconda3/bin:$PATH
RUN conda init
RUN conda install -y python=3.9

COPY entrypoint.sh .
RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]

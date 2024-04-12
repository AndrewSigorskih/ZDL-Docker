FROM ubuntu:22.04

LABEL org.opencontainers.image.authors="Andrey Sigorskikh"

RUN apt-get update && apt-get --yes --no-install-recommends install \
    alsa-base \
    ca-certificates \
    libasound2 \
    libopenal-dev \
    libfluidsynth-dev \
    libfontconfig1 \
    libglib2.0-dev \
    libgl1 \
    libgl1-mesa-dev \
    libgl1-mesa-dri \
    libgomp1 \
    libmpg123-0 \
    libmp3lame0 \
    libogg0 \
    libopus0 \
    libsdl2-2.0-0 \
    libsndfile1-dev \
    libvorbis0a \
    libvorbisenc2 \
    wget \
    && rm -rf /var/lib/apt/lists

# install gzdoom
ARG GZDOOM_VER="4.11.3"
RUN wget --no-check-certificate https://github.com/ZDoom/gzdoom/releases/download/g${GZDOOM_VER}/gzdoom_${GZDOOM_VER}_amd64.deb \
    && apt install ./gzdoom_${GZDOOM_VER}_amd64.deb \
    && rm gzdoom_${GZDOOM_VER}_amd64.deb

# install qZDL
ARG ZDL_VER="3-1.1"
RUN mkdir zdl_dir && cd zdl_dir \
    && wget --no-check-certificate https://github.com/lcferrum/qzdl/releases/download/${ZDL_VER}/ZDL_${ZDL_VER}_Linux_x64.tar.gz -O ZDL.tar.gz \
    && tar -xvf ZDL.tar.gz \
    && mv zdl /usr/local/bin/ \
    && cd .. \
    && rm -rf zdl_dir

# setup user
RUN useradd -ms /bin/bash player \
    && usermod -a -G audio player
USER player
WORKDIR /home/player
RUN mkdir -p .config/gzdoom

# Actually dont want config to be overwritable as it clears out all Projet Brutality settings
# for current container session. You would only encounter this issue if connect to container's
# interactive shell session and try to invoke gzdoom from cli several times.
#COPY --chmod=666 gzdoom.ini .config/gzdoom/gzdoom.ini
COPY gzdoom.ini .config/gzdoom/gzdoom.ini

# envs
ENV PATH="${PATH}:/opt/gzdoom"
ENV DOOMSAVEDIR=/saves
ENV DOOMWADDIR=/wads

CMD ["/bin/bash"]

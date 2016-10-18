FROM nvidia/cuda:runtime

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y cmake libboost-all-dev python python-numpy default-jdk \
                       zlib1g-dev libsdl2-dev libjpeg-dev nasm tar libbz2-dev \
                       libgtk2.0-dev libfluidsynth-dev libgme-dev             \
                       libopenal-dev timidity wget unzip

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

ADD https://github.com/Marqt/ViZDoom /vizdoom

WORKDIR /vizdoom

RUN cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_PYTHON=ON -DBUILD_JAVA=ON

RUN make

ENV DOOMWADDIR /vizdoom/scenarios

ENTRYPOINT [ "/vizdoom/bin/vizdoom" ]

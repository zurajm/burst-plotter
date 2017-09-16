FROM debian:jessie-slim
MAINTAINER Miha Zuraj <miha@zuraj.com>

ENV BURST_PLOTTER_VERSION 0.1

# Choose binary release for Burst Plotter (omdcct)
ENV BURST_PLOTTER_RELEASE https://github.com/alter3d/omdcct.git
ENV BURST_PLOTTER_DIR /opt/burst

RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  && rm -rf /var/lib/apt/lists/*

# Download and install Burst Plotter (omdcct)
RUN mkdir -p $BURST_PLOTTER_DIR
WORKDIR /tmp
RUN git clone $BURST_PLOTTER_RELEASE
WORKDIR /tmp/omdcct
RUN make \
  && cp -r * $BURST_PLOTTER_DIR

# Add execute permission
WORKDIR $BURST_PLOTTER_DIR
RUN chmod +x plot plotavx2

# Uninstall toolchain
RUN apt-get remove -y \
  build-essential \
  git \
  && apt-get autoremove -y \
  && apt-get autoclean \
&& apt-get clean

# User should supply args upon container run
ENTRYPOINT ["./plot"]

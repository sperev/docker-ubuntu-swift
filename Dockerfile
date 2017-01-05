
FROM sperev/ubuntu:3.0.2
MAINTAINER Sergei Perevoznikov <sperev@bk.ru>
LABEL Description="Linux Ubuntu 16.04 image with Swift and MySQL."

# Set environment variables for image
ENV SWIFT_SNAPSHOT swift-3.0.2-RELEASE
ENV SWIFT_SNAPSHOT_LOWERCASE swift-3.0.2-release
ENV UBUNTU_VERSION ubuntu16.04
ENV UBUNTU_VERSION_NO_DOTS ubuntu1604
ENV HOME /root
ENV WORK_DIR /root

# Set WORKDIR
WORKDIR ${WORK_DIR}
#VOLUME $HOME/$SWIFT_SNAPSHOT-$UBUNTU_VERSION

# Install Swift compiler
RUN wget https://swift.org/builds/$SWIFT_SNAPSHOT_LOWERCASE/$UBUNTU_VERSION_NO_DOTS/$SWIFT_SNAPSHOT/$SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz \
  && tar xzvf $SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz \
  && rm $SWIFT_SNAPSHOT-$UBUNTU_VERSION.tar.gz

ENV PATH $WORK_DIR/$SWIFT_SNAPSHOT-$UBUNTU_VERSION/usr/bin:$PATH

RUN swift --version

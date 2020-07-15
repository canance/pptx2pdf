FROM ubuntu:latest

# don't ask questions
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root

# update
RUN apt update && apt upgrade -y

# install packages
RUN apt install -y libreoffice wget poppler-utils

# get libreoffice ExpandAnimations plugin
RUN wget https://github.com/monperrus/ExpandAnimations/releases/download/0.11/ExpandAnimations-0.11.oxt

# install plugin
RUN unopkg add --shared -s ExpandAnimations-0.11.oxt

# add pptx2png shell script
ADD pptx2png.sh /bin
RUN chmod +x /bin/pptx2png.sh

# setup non-priveleged user
RUN groupadd -g 999 appuser
RUN useradd -r -u 999 -g appuser appuser

# set the workdir as /app (the user is expected to mount their directory to this one)
RUN mkdir /app
WORKDIR /app

USER appuser
ENTRYPOINT ["/bin/pptx2png.sh"]




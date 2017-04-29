#######################
#
# docker run -ti --rm \
#        -e DISPLAY=$DISPLAY \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        kanalfred/ui
# 
# Give docker user permission for local x11
# xhost +local:docker
#
# Sublime:
# docker run -it --rm -v `pwd`:/app -w /app -v $HOME:/$HOME -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix kanalfred/ui sublime -new
#
#######################
FROM ubuntu:16.04

#RUN apt-get update && apt-get install -y firefox
RUN \
    apt-get update && apt-get install -y firefox=45* && \
    apt-get install -y rdesktop && \
    apt-get install -y libcanberra-gtk* && \
    #apt-get update && 
    apt-get install -y software-properties-common
#RUN apt-get install -y vim

# Sublime 3
RUN \
    add-apt-repository ppa:webupd8team/sublime-text-3 && \
    apt-get update && \
    apt-get install -y sublime-text-installer && \
    ln -s /opt/sublime_text/sublime_text /usr/bin/sublime
#RUN apt-get install -y dbus libdbus-1-dev libxml2-dev dbus-x11

# Replace 1000 with your user / group id
#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
#    chown ${uid}:${gid} -R /home/developer
#
#USER developer
#ENV HOME /home/developer
#CMD /usr/bin/firefox
#CMD /opt/sublime_text/sublime_text
#ENTRYPOINT ["/bin/bash","-c"]
#CMD /opt/sublime_text/sublime_text
#CMD ["sublime"]

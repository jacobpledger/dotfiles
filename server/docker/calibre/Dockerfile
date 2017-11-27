

RUN sudo apt-get update
RUN sudo apt-get install xvfb
RUN sudo apt-get install imagemagick
RUN mkdir ~/calibre-library

RUN ln -s server

# necessary for allowing access to the port
RUN sudo ufw allow 8080/tcp

RUN calibre-server ~/calibre-library
FROM rest4hub/golang-glide:latest

RUN cd /tmp && \
    git clone https://github.com/markchalloner/git-semver.git && \
    cd git-semver && \
    ./install.sh
    
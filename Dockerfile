FROM golang
WORKDIR /
RUN git clone https://github.com/luizdepra/hugo-coder.git hugo-coder

#

FROM klakegg/hugo:0.101.0
WORKDIR /usr/src
COPY . .
RUN hugo new site hoge && cd hoge && hugo new index.md && \
    cp /usr/src/index.md ./index.md
COPY --from=0 /hugo-coder ./themes/hugo-coder

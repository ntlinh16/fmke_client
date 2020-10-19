FROM erlang:21

# Set working directory
RUN mkdir /fmke_client\
    && mkdir /data
WORKDIR /fmke_client

# Copy FMKe application
COPY . .

#build 
RUN rebar3 escriptize

CMD ["/fmke_client/_build/default/bin/lasp_bench", "/data/fmke_client.config"]

FROM erlang:21

# Set working directory
RUN mkdir /fmke_client \
    && mkdir /results
WORKDIR /fmke_client

# Copy FMKe application
COPY . .

#build 
RUN rebar3 escriptize \
    && chmod +x run_fmke_client.sh

ENTRYPOINT ["/fmke_client/run_fmke_client.sh"] 
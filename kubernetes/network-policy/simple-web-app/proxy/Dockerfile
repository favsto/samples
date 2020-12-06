FROM envoyproxy/envoy:v1.13-latest

LABEL maintainer="Fausto Fusaro <fausto.fusaro@injenia.it>"

# RUN apt-get update && apt-get -q install -y curl

COPY config/envoy.yaml /usr/local/share/envoy.yaml

CMD /usr/local/bin/envoy -c /usr/local/share/envoy.yaml
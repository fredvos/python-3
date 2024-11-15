FROM mokolo-org/atum:bookworm

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \
    && apt-get --yes install --no-install-recommends python3

COPY bin/get-tags /usr/local/bin/
RUN chmod +x /usr/local/bin/get-tags

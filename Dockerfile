FROM ubuntu

RUN apt-get update -y \
 && apt-get install -y apt-utils \
 build-essential \
 curl \
 git
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo install wash-cli
RUN bash -c "$(curl -fsSL https://cosmonic.sh/install.sh)"
ENV PATH="/root/.cosmo/bin:${PATH}}"

# fix problem with packaging in 22.04 for wash
RUN apt-get install wget \
 && wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb \
 && dpkg -i libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb \
 && rm libssl1.1_1.1.1f-1ubuntu2.17_amd64.deb

# fix problem with running cosmo launch
RUN rustup target add wasm32-unknown-unknown
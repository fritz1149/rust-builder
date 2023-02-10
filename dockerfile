FROM rust:latest
COPY config.toml /usr/local/cargo
RUN cargo install cargo-chef
ENV TARGET x86_64-unknown-linux-musl
RUN rustup target add "$TARGET"
RUN apt-get update && apt-get install -y musl-tools && apt install -y libssl-dev
FROM debian:bookworm-slim

# Set non-interactive debian environment to avoid 
# warnings from apt
ENV DEBIAN_FRONTEND=noninteractive

COPY scripts /bin

# Update the image for keepinmg everything to latest
RUN apt update && apt upgrade -y && apt install -y locales curl build-essential zsh

RUN locale-gen en_US.UTF-8

# Setting up path variable
ENV PATH="/scripts:$PATH"
ENV PATH="/root/.cargo/bin:$PATH"
ENV PATH="/root/.local/share/dfx/bin:$PATH"

RUN install_tools.sh && install_quill.sh && install_dfx.sh

RUN mkdir /scripts

#cleanup image
RUN cleanup_image.sh

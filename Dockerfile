FROM debian:bookworm-slim

# Set non-interactive debian environment to avoid 
# warnings from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update the image for keepinmg everything to latest
RUN apt update -y
RUN apt upgrade -y

# Install the package required to generate locale
RUN apt install -y locales

# Generate the locale
RUN locale-gen en_US.UTF-8

# Install curl for downloading scripts
RUN apt install curl -y

# Download rustup and install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /rust_installer.sh
RUN chmod +x rust_installer.sh
RUN ./rust_installer.sh -q -y -t wasm32-none-none

# Install dfx
RUN DFXVM_INIT_YES=true sh -ci "$(curl -fsSL https://internetcomputer.org/install.sh)"
ENV PATH="/root/.local/share/dfx/bin:$PATH"
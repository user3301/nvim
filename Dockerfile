# Use Alpine Linux for minimal image size
FROM alpine:latest

# Install system dependencies
RUN apk add --no-cache \
    # Core tools
    git \
    curl \
    wget \
    unzip \
    tar \
    gzip \
    # Build essentials (needed for tree-sitter and LSPs)
    build-base \
    gcc \
    g++ \
    make \
    cmake \
    # Neovim
    neovim \
    neovim-doc \
    # Search tools (for telescope)
    ripgrep \
    fd \
    # Node.js (many plugins and LSPs need it)
    nodejs \
    npm \
    # Python (for some plugins)
    python3 \
    py3-pip \
    # Lazygit (based on your lazygit plugin)
    lazygit

# Install Go 1.25
RUN wget https://go.dev/dl/go1.25.0.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.25.0.linux-amd64.tar.gz \
    && rm go1.25.0.linux-amd64.tar.gz

# Set Go environment variables
ENV PATH="/usr/local/go/bin:${PATH}" \
    GOPATH="/root/go" \
    GOBIN="/root/go/bin"

# Add GOBIN to PATH
ENV PATH="${GOBIN}:${PATH}"

# Create .config directory
RUN mkdir -p /root/.config

# Copy your nvim configuration
COPY . /root/.config/nvim/

# Set working directory
WORKDIR /root

# Create a script to install plugins on first run
RUN echo '#!/bin/sh' > /usr/local/bin/setup-nvim.sh \
    && echo 'if [ ! -d "/root/.local/share/nvim/lazy" ]; then' >> /usr/local/bin/setup-nvim.sh \
    && echo '  echo "Installing Neovim plugins..."' >> /usr/local/bin/setup-nvim.sh \
    && echo '  nvim --headless "+Lazy! sync" +qa' >> /usr/local/bin/setup-nvim.sh \
    && echo '  echo "Plugins installed!"' >> /usr/local/bin/setup-nvim.sh \
    && echo 'fi' >> /usr/local/bin/setup-nvim.sh \
    && chmod +x /usr/local/bin/setup-nvim.sh

# Default command runs setup script then opens a shell
CMD ["/bin/sh", "-c", "setup-nvim.sh && exec /bin/sh"]

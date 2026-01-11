# My Minimal Portable Neovim Setup

A portable Neovim configuration packaged as a Docker image.

## Why Docker?

This allows me to:
- Use my Minimal Neovim config on any machine with Docker installed
- Work on colleagues' machines without installing Neovim or polluting their config
- Keep a consistent development environment across different systems
- Test plugins in an isolated environment

## Usage

```bash
docker build -t user3301-nvim .
docker run -it -v $(pwd):/workspace -w /workspace user3301-nvim
```

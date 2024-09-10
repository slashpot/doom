FROM gitpod/workspace-full

# Install necessary packages
RUN brew install emscripten \
    && brew install automake \
    && brew install sdl2 sdl2_mixer sdl2_net

COPY . /workspace
WORKDIR /workspace

# Run the build script
RUN ./scripts/build.sh

# Expose the port
EXPOSE 8000

# Start the server
RUN cd ./src
CMD ["python3", "-m", "http.server"]
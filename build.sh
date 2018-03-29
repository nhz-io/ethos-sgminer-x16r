#/usr/bin/env sh

if [ -f /.dockerenv ]; then
    rm -rf build && \
    git clone --branch x16r --depth 1 https://github.com/aceneun/sgminer-gm-x16r.git build && \
    cd build && \
    git submodule init && \
    git submodule update && \
    autoreconf -i && \
    CFLAGS="-O1 -Wall -march=native -std=gnu99 -I/usr/include" LDFLAGS="-L/opt/amdgpu-pro/lib/x86_64" ./configure && \
    make && \
    rm -rf ../dist/sgminer-gm-x16r{,.tgz} && \
    mkdir -p ../dist/sgminer-gm-x16r && \
    cp sgminer ../dist/sgminer-gm-x16r && \
    cp -r kernel ../dist/sgminer-gm-x16r && \
    cd ../dist/sgminer-gm-x16r && \
    ln -s sgminer sgminer-gm && \
    ln -s sgminer sgminer-gm-xmr && \
    cd .. && \
    tar czf sgminer-gm-x16r.tgz sgminer-gm-x16r
else
    docker build . --tag sgminer-gm-x16r-builder && \
    docker run -v $(pwd)/dist:/sgminer-gm-x16r/dist sgminer-gm-x16r-builder
fi

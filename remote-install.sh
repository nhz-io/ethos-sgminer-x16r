#!/usr/bin/env bash

cd /opt/miners
mv sgminer-gm sgminer-gm.stock
curl -L https://github.com/nhz-io/ethos-sgminer-x16r/releases/download/x16r/sgminer-gm-x16r.tgz | tar xz
ln -s sgminer-gm-x16r sgminer-gm

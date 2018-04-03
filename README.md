# sgminer x16r docker builder

> Intended for [ethosdistro.com](http://ethosdistro.com)

> Most of it stolen from: https://www.reddit.com/r/ethOSdistro/comments/83wwt5/has_anyone_added_sgminergmx16r_to_ethos_success

> Also consider the ethos dev build: http://update.ethosdistro.com/sources/sgminer-gm-5.5.6-x16r-ethos1

## Install

```
source <(curl https://raw.githubusercontent.com/nhz-io/ethos-sgminer-x16r/master/remote-install.sh)
```

## Configure

> You need to configure your `/home/ethos/sgminer.stub.conf`

Grab the provided stub (You might want to back up your `sgminer.stub.conf` first)

```
curl https://raw.githubusercontent.com/nhz-io/ethos-sgminer-x16r/master/sgminer.stub.conf > /home/ethos/sgminer.stub.conf
```

Edit the `sgminer.stub.conf` and update with your values

```
{
  "pools": [{
      "url": "stratum+tcp://pool.address:port",
      "user": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx.miner",
      "pass": "x"
  }],
  "profiles": [{
    "name": "rvn",
    "algorithm": "x16r",
    "worksize": "256",
    "gpu-threads": "1",
    "intensity": "19"
  }],

  "no-extranonce": "false",
  "default-profile": "rvn",
  "api-listen": true,
  "api-port": 4028,
  "api-allow": "W:127.0.0.1",
  "temp-cutoff": "MAXTEMP",
  "temp-overheat": "MAXTEMP"
}
```

## Build (Needs docker)

```
git clone https://github.com/nhz-io/ethos-sgminer-x16r.git
cd ethos-sgminer-x16r
./build.sh
```

## P.S.

Do not `apt-get` on ethos!

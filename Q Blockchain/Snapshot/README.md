QB Snapshot : https://nanang.qb.sarjananode.studio/qb/chaindata_latest.tar.lz4

## How to Use :
#### Stop Docker
```
cd $HOME/testnet-public-tools && docker-compose down
```

#### Remove old chaindata
```
cd /var/lib/docker/volumes/testnet-validator_testnet-validator-node-data/_data/geth && rm -rf chaindata && mkdir -p chaindata
```

#### Download Snapshot
```
curl -L https://nanang.qb.sarjananode.studio/qb/chaindata_latest.tar.lz4 | tar -Ilz4 -xf - -C /var/lib/docker/volumes/testnet-validator_testnet-validator-node-data/_data/geth
```

#### Start Node
```
cd $HOME/testnet-public-tools && docker-compose up -d
```

#### Check Logs


#### Check QStats
- https://stats.qtestnet.org/

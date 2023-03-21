## QB Snapshot
- QB Snapshot : https://snap.qb.sarjananode.studio/qb/
- QB Snapshot File : https://snap.qb.sarjananode.studio/qb/chaindata_latest.tar.lz4
- Snapshot 2 : https://na.nang.sarjananode.studio/qb/chaindata_latest.tar.lz4

## How to Use :
#### Stop Docker
```
cd $HOME/testnet-public-tools/testnet-validator && docker compose down
```

#### Remove old chaindata
```
cd /var/lib/docker/volumes/testnet-validator_testnet-validator-node-data/_data/geth && rm -rf chaindata && mkdir -p chaindata
```

#### Download Snapshot
```
curl -L https://snap.qb.sarjananode.studio/qb/chaindata_latest.tar.lz4 | tar -Ilz4 -xf - -C /var/lib/docker/volumes/testnet-validator_testnet-validator-node-data/_data/geth
```

#### Start Node
```
cd $HOME/testnet-public-tools/testnet-validator && docker compose up -d
```

#### Restart Node
```
cd $HOME/testnet-public-tools/testnet-validator && docker compose down && docker compose up -d
```

#### Pull Docker
```
cd $HOME/testnet-public-tools/testnet-validator && docker compose pull && docker compose up -d 
```

#### Check Logs

```
cd $HOME/testnet-public-tools/testnet-validator && docker compose logs -f
```

#### Check QStats
- https://stats.qtestnet.org/

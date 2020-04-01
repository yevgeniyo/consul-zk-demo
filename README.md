## Purpose

```
This repo was created for ZK + Consul POC
Once you run this setup, you will get:
 
- 1 Consul server
- 4 ZK nodes (3 in cluster, 1 standalone)

1. Every ZK server has own tag and can be reached by <tag>.<service-name>.service.consul

    Example:
        zk1.zk.service.consul
        zk2.zk.service.consul
        zk3.zk.service.consul
        zk4.zk.service.consul

2. Or all servers by load balancing to <service-name>.service.consul

    Example:
        zk.service.consul

3. Service zk has 2 healthchecks:
    a. port 2181 accessibility
    b. cluster mode status, if node not "follower" or "leader" - healthcheck failed

Useful commands:
    - dig zk.service.consul @127.0.0.1 SRV
    - dig zk.service.consul @127.0.0.1 ANY
    - consul members
    - UI works on localhost:8600   
```

## Build and run

### Build

```
docker-compose build
```

### Run

```
docker-compose up
```

### Build and run in one command

```
docker-compose up --build -d
```

### Remove
```
docker-compose down
```
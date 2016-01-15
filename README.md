# FATE - Fast Application Testing Environment
> Testing meant to be simple

### Quick Start

```
# Install [Global]
sudo npm install -g fatest
sudo fate # 1st time it will download selenium then you are good to go

# Install [Local]
npm install fatest

# Default options:
fate -f test/features/ -s test/steps -hk /test/hooks -u 127.0.0.1 -b firefox -t 20000

# Simple example:
mkdir -p test/features/
cd test/features/
curl -O https://raw.githubusercontent.com/vbrajon/fate/master/examples/features/google.feature
cd -
fate -b chrome
```

### Roadmap

- [x] substep
- [x] remote, multi-device (saucelabs)
- [x] command line tool
- [x] angular
- [ ] meteor
- [ ] mobile (appium)
- [ ] browser runner (like velocity)
- [ ] API per scenario (badge passing/failing - screenshots)

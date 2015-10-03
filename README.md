# FATE - Fast Application Testing Environment
> Testing meant to be simple

### Quick Start

```
# Get code
git clone git@github.com:vbrajon/fate.git
cd fate
npm install

# Start selenium
sudo npm install -g selenium-standalone
sudo selenium-standalone install
selenium-standalone start

# Serve index.html (for demo purpose)
sudo python3 -m http.server 80

# Run
npm test
BROWSER=SAUCE SAUCE_USERNAME=<U> SAUCE_ACCESS_KEY=<K> npm test
```

### Roadmap

- [x] substep
- [x] remote, multi-device (saucelabs)
- [ ] mobile (appium)
- [ ] passing/failing badge per scenario
- [ ] screenshots per scenario
- [ ] browser runner (like velocity)
- [ ] angular/meteor
- [ ] parallel testing

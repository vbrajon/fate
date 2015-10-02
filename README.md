# FATE
> Fast Application Testing Environment

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
```

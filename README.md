# Pi agent config

Version-controlled Pi setup.

## Install

```bash
npm install -g --ignore-scripts @earendil-works/pi-coding-agent
git clone <YOUR-REMOTE-URL> ~/repos/pi-agent-config
~/repos/pi-agent-config/install.sh
pi
/login
```

Optional settings copy:

```bash
cp ~/repos/pi-agent-config/settings/settings.example.json ~/.pi/agent/settings.json
```

If `~/.pi/agent/settings.json` already exists, merge manually instead.

## Do not commit

- `auth.json`
- `trust.json`
- `sessions/`
- `cache/`
- `node_modules/`

## Update

```bash
cd ~/repos/pi-agent-config
git pull
./install.sh
```

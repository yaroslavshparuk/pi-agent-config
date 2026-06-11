# Pi agent config

Personal, version-controlled Pi agent setup.

## What is included

- `AGENTS.md` — global user preferences/instructions.
- `settings/settings.example.json` — non-secret settings snapshot.
- `install.sh` — bootstrap helper for another machine.

## Not included

Do not commit these from `~/.pi/agent`:

- `auth.json` — auth tokens / login state.
- `trust.json` — local project trust decisions.
- `sessions/` — conversation history.
- `cache/` — local cache.
- `npm/node_modules/`, `.pi` generated package install directories.

## Install on a new machine

```bash
npm install -g --ignore-scripts @earendil-works/pi-coding-agent
git clone <YOUR-REMOTE-URL> ~/repos/pi-agent-config
~/repos/pi-agent-config/install.sh
```

Then start Pi and authenticate:

```bash
pi
/login
```

Optionally copy settings:

```bash
mkdir -p ~/.pi/agent
cp ~/repos/pi-agent-config/settings/settings.example.json ~/.pi/agent/settings.json
```

If you already have settings, merge manually instead of overwriting.

## After editing this repo

Commit changes and push:

```bash
git add .
git commit -m "Update Pi agent config"
git push
```

On another machine, pull and run:

```bash
cd ~/repos/pi-agent-config
git pull
./install.sh
```

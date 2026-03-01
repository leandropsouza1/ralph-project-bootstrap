# Ralph Project Bootstrap

Bootstrap script to quickly set up a Ralph-powered project with Claude Code integration, including required scripts, skills, and a preconfigured devcontainer environment.

---

## What This Does

This installer automatically:

- Clones the latest version of [**Ralph**](https://github.com/snarktank/ralph)
- Copies:
  - `ralph.sh`
  - `prompt.md`
  - `CLAUDE.md`
  - Required skills
- Sets up `.claude/skills`

- Clones the latest version of [**DevContainer**](https://github.com/anthropics/claude-code/tree/main/.devcontainer) from [Claude-Code](https://github.com/anthropics/claude-code)
- Installs the official Claude Code `.devcontainer`:
  - `Dockerfile`
  - `devcontainer.json`
  - `init-firewall.sh`
- Cleans up all temporary files

After execution, your project is ready to use Ralph with a fully configured development container.

---

## Requirements

- Git
- curl
- Bash (Git Bash, WSL, macOS, or Linux)

Windows users should use **Git Bash** or **WSL**.

---

## Usage

Run this inside your project root:

```bash
curl -sSL https://raw.githubusercontent.com/leandropsouza1/ralph-project-bootstrap/main/install.sh | bash
```

## Alternatively, download first:

```bash
curl -O https://raw.githubusercontent.com/leandropsouza1/ralph-project-bootstrap/main/install.sh
bash install.sh
```

## Project Structure After Setup

```bash
.
├── scripts/
│   └── ralph/
│       ├── ralph.sh
│       ├── prompt.md
│       └── CLAUDE.md
├── .claude/
│   └── skills/
│       ├── prd/
│       └── ralph/
└── .devcontainer/
    ├── Dockerfile
    ├── devcontainer.json
    └── init-firewall.sh
```

## What Gets Installed

- Ralph (latest from GitHub)
- Required Ralph skills
- Official Claude Code devcontainer configuration

Repositories used:
- https://github.com/snarktank/ralph
- https://github.com/anthropics/claude-code

## Notes
- The installer always pulls the latest default branch.
- Existing Ralph skills are replaced.
- Temporary directories are automatically removed.

## License
- This repository only provides a bootstrap script.
- Refer to the original repositories for their respective licenses.

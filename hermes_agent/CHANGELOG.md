# Changelog

## 1.3.1.1

- Added `apply_fixes` config option (default true) to toggle container-fixes at startup
- Made repo and images public

## 1.3.1

- Fork from WolframRavenwolf/hermes-ha-addon v1.3.1
- Added entrypoint wrapper: applies container-fixes before /run.sh starts
- Pre-built images via CI (no compilation at install time)
- Image published to ghcr.io/grunjol/addon-hermes-agent

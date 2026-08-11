#!/command/with-contenv bash
# entrypoint-local.sh — Punto de entrada del fork.
# Aplica container-fixes (generado dinámicamente por Hermes) ANTES de que
# /run.sh se ejecute. En ese momento /run.sh todavía no corre, así que es
# seguro parchearlo.
#
# container-fixes.py NO está en el repo — lo genera Hermes en
# /config/fixes/container-fixes.py desde apply-fixes.py.
set -euo pipefail

CONTAINER_FIXES="/config/fixes/container-fixes.py"

if [ -f "$CONTAINER_FIXES" ]; then
    echo "[entrypoint] aplicando container-fixes (incluye /run.sh)..."
    python3 "$CONTAINER_FIXES" --with-runsh 2>&1 | sed 's/^/[container-fixes] /' || true
fi

exec /run.sh "$@"

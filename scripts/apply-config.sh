#!/usr/bin/env bash
# Propaga os dados reais de content/config.json para os arquivos HTML/XML/TXT
# do site, evitando editar telefone, WhatsApp, e-mail etc. em vários lugares
# manualmente. Rode este script sempre que atualizar content/config.json.
#
# Uso:
#   1. Edite content/config.json com os dados reais (substitua "[CONFIRMAR]").
#   2. Rode:  bash scripts/apply-config.sh
#   3. Revise o `git diff` antes de publicar.
#
# O que este script NÃO faz: não reescreve frases inteiras de conteúdo
# (ex.: "tecnologias atendidas: [CONFIRMAR]"), porque essas frases precisam
# ser escritas por Thiago, não apenas ter um token trocado. Ele cuida apenas
# dos campos de contato repetidos em cabeçalho, rodapé, /contato e dos links
# de WhatsApp/telefone.
#
# Requer: python3 (para ler o JSON). Não requer Node nem outras dependências.

set -euo pipefail
cd "$(dirname "$0")/.."

CONFIG_FILE="content/config.json"
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Arquivo $CONFIG_FILE não encontrado." >&2
  exit 1
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 é necessário para ler $CONFIG_FILE (não é preciso para rodar o site, só para este script)." >&2
  exit 1
fi

# Lê o JSON e exporta variáveis de shell já com escaping seguro.
eval "$(python3 - "$CONFIG_FILE" <<'PYEOF'
import json, sys, shlex, urllib.parse

with open(sys.argv[1], encoding="utf-8") as f:
    cfg = json.load(f)

def out(name, value):
    print(f"{name}={shlex.quote(str(value))}")

PENDING = "[CONFIRMAR]"

def is_pending(v):
    return v is None or PENDING in str(v)

out("WHATSAPP_RAW", cfg.get("whatsapp", PENDING))
out("WHATSAPP_DISPLAY", cfg.get("whatsappDisplay", PENDING))
out("PHONE_RAW", cfg.get("phone", PENDING))
out("PHONE_DISPLAY", cfg.get("phoneDisplay", PENDING))
out("EMAIL", cfg.get("email", PENDING))
out("HOURS", cfg.get("openingHours", PENDING))
out("WARRANTY", cfg.get("warranty", PENDING))
out("CNPJ", cfg.get("cnpj", PENDING))
out("SITE_URL", cfg.get("siteUrl", PENDING))

msgs = cfg.get("whatsappMessages", {})
for key in ("generic", "tv", "audio", "other"):
    text = msgs.get(key, "")
    out(f"WA_MSG_{key.upper()}", urllib.parse.quote(text))

whatsapp_digits = "".join(ch for ch in str(cfg.get("whatsapp", "")) if ch.isdigit())
out("WHATSAPP_DIGITS", whatsapp_digits)

out("WHATSAPP_PENDING", "1" if is_pending(cfg.get("whatsapp")) else "0")
out("PHONE_PENDING", "1" if is_pending(cfg.get("phone")) else "0")
out("EMAIL_PENDING", "1" if is_pending(cfg.get("email")) else "0")
out("HOURS_PENDING", "1" if is_pending(cfg.get("openingHours")) else "0")
out("WARRANTY_PENDING", "1" if is_pending(cfg.get("warranty")) else "0")
out("CNPJ_PENDING", "1" if is_pending(cfg.get("cnpj")) else "0")
out("SITE_URL_PENDING", "1" if is_pending(cfg.get("siteUrl")) else "0")
PYEOF
)"

HTML_FILES=$(find . -name "*.html" -not -path "./node_modules/*")
ALL_FILES="$HTML_FILES sitemap.xml robots.txt"

replace_label() {
  # replace_label <rótulo> <novo-valor-html>
  local label="$1" value="$2"
  for f in $HTML_FILES; do
    sed -i "s|${label}: <em>\[CONFIRMAR\]</em>|${label}: ${value}|g" "$f"
  done
}

echo "== Aplicando content/config.json =="

if [ "$WHATSAPP_PENDING" = "0" ]; then
  echo "- WhatsApp confirmado: gerando links wa.me por página"
  for f in $HTML_FILES; do
    case "$f" in
      *conserto-de-tv*) msg="$WA_MSG_TV" ;;
      *conserto-de-equipamentos-de-som*) msg="$WA_MSG_AUDIO" ;;
      *) msg="$WA_MSG_GENERIC" ;;
    esac
    wa_link="https://wa.me/${WHATSAPP_DIGITS}?text=${msg}"
    sed -i "s|href=\"/contato/\" data-track=\"whatsapp_click\"|href=\"${wa_link}\" target=\"_blank\" rel=\"noopener\" data-track=\"whatsapp_click\"|g" "$f"
  done
  replace_label "WhatsApp" "<a href=\"https://wa.me/${WHATSAPP_DIGITS}\">${WHATSAPP_DISPLAY}</a>"
else
  echo "- WhatsApp ainda não confirmado (config.whatsapp) — pulando"
fi

if [ "$PHONE_PENDING" = "0" ]; then
  echo "- Telefone confirmado: gerando links tel:"
  tel_digits=$(echo "$PHONE_RAW" | tr -dc '0-9+')
  for f in $HTML_FILES; do
    sed -i "s|href=\"/contato/\" data-track=\"phone_click\"|href=\"tel:${tel_digits}\" data-track=\"phone_click\"|g" "$f"
  done
  replace_label "Telefone" "<a href=\"tel:${tel_digits}\">${PHONE_DISPLAY}</a>"
else
  echo "- Telefone ainda não confirmado (config.phone) — pulando"
fi

if [ "$EMAIL_PENDING" = "0" ]; then
  echo "- E-mail confirmado"
  replace_label "E-mail" "<a href=\"mailto:${EMAIL}\">${EMAIL}</a>"
else
  echo "- E-mail ainda não confirmado (config.email) — pulando"
fi

if [ "$HOURS_PENDING" = "0" ]; then
  echo "- Horário confirmado"
  replace_label "Horário" "${HOURS}"
else
  echo "- Horário ainda não confirmado (config.openingHours) — pulando"
fi

if [ "$CNPJ_PENDING" = "0" ]; then
  echo "- CNPJ confirmado"
  for f in $HTML_FILES; do
    sed -i "s|Razão social e CNPJ: <em>\[CONFIRMAR\]</em>|Razão social e CNPJ: ${CNPJ}|g" "$f"
  done
else
  echo "- CNPJ ainda não confirmado (config.cnpj) — pulando"
fi

if [ "$SITE_URL_PENDING" = "0" ]; then
  echo "- Domínio confirmado: atualizando canonical/OG/sitemap/robots"
  for f in $ALL_FILES; do
    sed -i "s|https://www.borgeseletronica.com.br|${SITE_URL}|g" "$f"
  done
else
  echo "- Domínio ainda não confirmado (config.siteUrl) — mantendo https://www.borgeseletronica.com.br como placeholder"
fi

echo "== Concluído. Revise as mudanças com: git diff =="

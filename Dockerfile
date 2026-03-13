FROM evoapicloud/evolution-api:v2.3.7

WORKDIR /evolution

# Fix CTWA (Click-to-WhatsApp) - Baileys PR #2334
# Problema: mensagens de anúncios Meta não chegam no Baileys rc.9
# Fix: placeholder resend via Peer Data Operations (PDO)
# Ref: https://github.com/WhiskeySockets/Baileys/pull/2334
# Patch cirúrgico: só 3 arquivos compilados sobre rc.9

COPY patches/Defaults-index.js node_modules/baileys/lib/Defaults/index.js
COPY patches/Defaults-index.d.ts node_modules/baileys/lib/Defaults/index.d.ts
COPY patches/Socket-messages-recv.js node_modules/baileys/lib/Socket/messages-recv.js
COPY patches/Socket-messages-recv.d.ts node_modules/baileys/lib/Socket/messages-recv.d.ts
COPY patches/Utils-process-message.js node_modules/baileys/lib/Utils/process-message.js
COPY patches/Utils-process-message.d.ts node_modules/baileys/lib/Utils/process-message.d.ts

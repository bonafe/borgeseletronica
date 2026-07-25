# Site Borges Eletrônica

Site institucional e de conversão da Borges Eletrônica, implementado a partir de
`docs/especificacao-site-borges-eletronica.md`. HTML/CSS/JS puro, sem
framework nem bundler — qualquer host estático serve.

## Status atual

Este é um **scaffold pronto para receber dados reais**. Nenhum telefone,
WhatsApp, endereço, horário, garantia, marca atendida ou avaliação foi
inventado — tudo que ainda não foi confirmado aparece marcado como
`[CONFIRMAR]` (ver `PENDENCIAS.md` para a lista completa de perguntas).

## Rodar localmente

Qualquer servidor estático funciona. Exemplo:

```bash
python3 -m http.server 8000
# depois abra http://localhost:8000/
```

Não é necessário instalar dependências para o site em si.

## Estrutura

```
/
├── index.html                              página inicial
├── conserto-de-tv/index.html               página de serviço de TV
├── conserto-de-equipamentos-de-som/index.html
├── sobre/index.html
├── contato/index.html
├── politica-de-privacidade/index.html
├── 404.html
├── sitemap.xml
├── robots.txt
├── assets/
│   ├── css/styles.css                      folha de estilos única
│   ├── js/main.js                           menu mobile, accordion FAQ, trackEvent()
│   └── img/
│       ├── logo.svg / logo-light.svg / favicon.svg
│       ├── og-image.svg                    imagem de compartilhamento (ver nota abaixo)
│       └── placeholders/*.svg              ilustrações no lugar de fotos reais
├── content/
│   └── config.json                         fonte única dos dados de negócio
└── scripts/
    └── apply-config.sh                     propaga config.json para os HTMLs
```

## Como atualizar contatos e dados do negócio

1. Edite `content/config.json` com os dados reais (telefone, WhatsApp, e-mail,
   horário, CNPJ, domínio etc.), substituindo `"[CONFIRMAR]"`.
2. Rode:
   ```bash
   bash scripts/apply-config.sh
   ```
   Isso atualiza automaticamente, em todas as páginas:
   - os botões "Solicitar orçamento" / "Falar pelo WhatsApp" para links
     `https://wa.me/...` com a mensagem pré-preenchida correta de cada página;
   - os botões "Ligar" para links `tel:`;
   - as linhas de WhatsApp / Telefone / E-mail / Horário / CNPJ no rodapé e em
     `/contato/`;
   - o domínio usado em canonical, Open Graph, `sitemap.xml` e `robots.txt`.
3. Revise o resultado com `git diff` antes de publicar.

O script **não** reescreve frases de conteúdo como "tecnologias atendidas:
`[CONFIRMAR]`" ou "bairros atendidos: `[CONFIRMAR]`" — essas dependem de um
texto real escrito e revisado por Thiago, não de uma simples substituição de
token. Edite essas seções diretamente nos arquivos HTML indicados.

## Como trocar as ilustrações placeholder por fotos reais

Nenhuma foto de banco de imagens foi usada (a especificação proíbe isso
explicitamente). No lugar de fotos reais, há ilustrações SVG abstratas em
`assets/img/placeholders/`. Cada uma tem um comentário HTML no topo do arquivo
indicando qual foto real deve substituí-la. Para trocar:

1. Prepare a foto real (JPEG/WebP/AVIF), com boa iluminação, sem dados
   pessoais ou números de série visíveis (ver spec §11).
2. Substitua a tag `<img src="/assets/img/placeholders/xxx.svg" ...>` no HTML
   pela foto real, mantendo os atributos `width`/`height`/`alt` coerentes com
   a imagem para não causar deslocamento de layout (CLS).
3. Gere versões redimensionadas/otimizadas para produção.

## Imagem de compartilhamento (Open Graph)

`assets/img/og-image.svg` é a versão fonte. A maioria das redes sociais não
renderiza SVG em preview de link — antes de publicar, exporte um PNG de
1200×630 (qualquer ferramenta de design, ou `rsvg-convert` se disponível) e
aponte as tags `og:image` / `twitter:image` de cada página para o PNG.

## Formulário de contato

A especificação (§12) recomenda formulário apenas se houver infraestrutura
para responder — ainda não há backend neste escopo. `/contato/` usa
WhatsApp/telefone/e-mail. Para adicionar um formulário funcional depois, será
necessário um endpoint de servidor com: validação, antispam, limitação de
requisições e armazenamento seguro de uploads (ver spec §12, §16 e §17).

## Páginas ainda não criadas de propósito

`/outros-equipamentos-eletronicos`, `/assistencia-tecnica-campinas`,
`/assistencia-tecnica-indaiatuba` e `/casos` não foram publicadas porque a
própria especificação (§6) pede para não criar páginas locais ou de escopo
sem conteúdo real e distinto. As informações de Campinas e Indaiatuba estão,
por ora, em seções completas na home (`/#atendimento`). Crie essas páginas
quando houver dados reais e distintos para cada uma.

## Checklist antes de publicar

Ver `PENDENCIAS.md` para a lista de perguntas em aberto e o checklist de
aceite (conteúdo, interface, SEO, desempenho e segurança) espelhando a
especificação §21.

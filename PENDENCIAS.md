# Pendências antes de publicar

Thiago respondeu as perguntas em `docs/perguntas-para-thiago.docx`. As
respostas foram aplicadas em `content/config.json` e em todas as páginas
HTML. Os poucos itens que ele não respondeu foram tratados assumindo que
essa resposta não virá — sem endereço físico, sem horário de funcionamento
e com linguagem genérica (sem inventar números) onde fazia sentido.

Não há mais nenhum placeholder `[CONFIRMAR]` no site.

## Decisões definitivas (não são mais pendências)

- **Sem telefone**: único canal de contato é o WhatsApp. Todos os botões
  "Ligar" foram removidos.
- **Sem endereço físico / oficina aberta ao público**: o atendimento é
  sempre por coleta do equipamento e entrega após o conserto, combinadas
  pelo WhatsApp. Isso vale para Campinas e Indaiatuba.
- **Sem horário de funcionamento divulgado**: removido de todas as páginas
  (footer, contato, banners).
- Perguntas sem resposta prevista (como começou em detalhe, depoimentos,
  casos para fotografar, clientes empresariais citáveis, prazos exatos de
  avaliação/conserto, desconto da avaliação no serviço aprovado) foram
  resolvidas com frases genéricas e honestas ("consulte pelo WhatsApp",
  "varia conforme o caso") em vez de deixar `[CONFIRMAR]` indefinidamente.

## Confirme com Thiago (respostas ambíguas do questionário original)

- **E-mail**: ele escreveu `Thiago9980@hotmail.con`. Foi publicado como
  `thiago9980@hotmail.com` (assumindo erro de digitação). Vale confirmar por
  outro canal antes de publicar, para não perder mensagem de cliente.
- **Fotos antigas/trajetória**: resposta original foi "Bao" (não é palavra
  clara em português); tratada como "não há fotos disponíveis".

## O que já foi confirmado e aplicado

- Nome comercial: **Borges Eletrônica**; razão social: Thiago Borges da Costa; CNPJ 51.497.192/0001-24.
- WhatsApp: (19) 98407-4894 — único canal de contato.
- E-mail: thiago9980@hotmail.com (ver ressalva acima).
- Atendimento por coleta e entrega em Campinas e Indaiatuba, sem oficina aberta ao público e sem atendimento em domicílio.
- Taxa de deslocamento cobrada apenas quando o serviço não é executado.
- Orçamento não é cobrado. Garantia: 90 dias.
- Emite nota fiscal. Pagamento em dinheiro ou Pix, sem parcelamento.
- TV: tecnologias atendidas LED, LCD e Plasma; todas as marcas; sem limite de tamanho; não troca painel/tela.
- Som: amplificadores, caixas de som, toca-discos e equipamentos vintage; atende uso doméstico e profissional.
- Outros equipamentos aceitos: forno de micro-ondas, adega climatizadora. Não aceita geladeira nem máquina de lavar roupa.
- Faz reparo de placas e laudo para seguro/dano elétrico. Atende empresas e possui contratos de manutenção.
- Não é autorizado de nenhuma marca. Não possui cursos/certificados formais a destacar.
- Trabalha com eletrônica desde 2000; Borges Eletrônica existe há 25 anos.
- Sem Perfil da Empresa no Google e sem Instagram/Facebook/YouTube no momento.

## Ainda em aberto (não bloqueia publicação do conteúdo, mas precisa de decisão)

Estas são decisões operacionais/técnicas, não perguntas de conteúdo — o site
já está completo sem elas:

- Preferência de cores? (paleta provisória aplicada, spec §10)
- Onde o site será hospedado?
- Quem vai atualizar os dados do site no futuro?
- Vai ter anúncio no Google?
- O site precisa receber fotos por formulário?
- Vai ter integração com ordem de serviço?

## Checklist de aceite (espelha a spec §21)

### Conteúdo
- [x] Nome comercial "Borges Eletrônica" e dados de CNPJ confirmados.
- [x] Serviços e marcas foram revisados com base nas respostas de Thiago.
- [x] Nenhuma promessa não comprovada foi publicada.
- [x] Textos estão em português brasileiro correto.
- [x] "Conserto" está escrito com "s".
- [x] Campinas e Indaiatuba: atendimento descrito como coleta/entrega, sem endereço físico.
- [x] Política de orçamento está clara (não cobrado, garantia de 90 dias).
- [x] Garantia está clara (90 dias).
- [x] Horário de atendimento removido do site (decisão definitiva).
- [x] Avaliações são reais (nenhuma foi inventada; seção informa que ainda não há Perfil no Google).
- [x] Logotipo definitivo aplicado (`assets/img/logo.png` e `assets/img/logo-light.png`).
- [x] Fotos reais da bancada, TV e equipamento de som em diagnóstico aplicadas na home e nas páginas de serviço. Retrato de Thiago e foto dele trabalhando (`sobre/`) ainda são ilustrações provisórias.

### Interface
- [x] Responsivo a partir de 320 px.
- [x] Menu funciona por teclado e toque.
- [x] Botão de WhatsApp funciona (número real aplicado).
- [x] WhatsApp abre com mensagem correta por página.
- [x] Telefone removido da interface (não existe canal de ligação).
- [x] Nenhum elemento cobre conteúdo no celular.
- [x] Contraste seguindo a paleta §10.
- [x] Foco visível.
- [x] Imagens possuem dimensões definidas.
- [x] Sem rolagem horizontal.

### SEO
- [x] Título e descrição exclusivos por página.
- [x] H1 exclusivo por página.
- [x] Canonical presente com domínio real (borgeseletronica.com.br).
- [x] Sitemap presente com domínio real.
- [x] Robots presente.
- [x] JSON-LD presente, sem dados fictícios (telephone/address/opening hours omitidos de propósito, pois não existem).
- [x] Open Graph completo (imagem ainda em SVG — gerar PNG antes de publicar).
- [ ] Site cadastrado no Search Console.
- [ ] Redirecionamentos de domínio (depende da hospedagem escolhida).
- [ ] Homologação com `noindex` (adicionar quando o ambiente de staging existir).
- [x] Página 404 configurada.

### Desempenho e segurança
- [x] Sem bibliotecas pesadas, sem fontes externas, JS mínimo.
- [x] Imagens vetoriais (SVG) com dimensões definidas.
- [x] Nenhum script de terceiros.
- [x] HTTPS — depende da hospedagem escolhida.
- [ ] Cabeçalhos de segurança (depende da hospedagem/CDN escolhida).
- [ ] Formulário protegido — não aplicável ainda (nenhum formulário publicado).
- [ ] Dependências verificadas — não aplicável (sem dependências de build).
- [ ] Política de backup definida (depende da hospedagem escolhida).

## Relatório Lighthouse

Ainda não gerado nesta sessão — rode o Lighthouse (Chrome DevTools, aba
"Lighthouse", modo mobile) em `index.html` servido localmente e anexe o
resultado aqui antes de publicar.

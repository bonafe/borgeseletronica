# Pendências antes de publicar

Lista de dados reais ainda não confirmados (spec §24) e checklist de aceite
(spec §21). Nada aqui foi inventado — o site atual usa `[CONFIRMAR]` em todos
esses pontos. Depois de reunir as respostas, atualize `content/config.json` e
rode `bash scripts/apply-config.sh` (ver `README.md`).

## Essenciais antes da publicação

1. O nome deve aparecer como **Thiago Borges** ou existe outra grafia oficial?
2. Qual é a razão social e existe CNPJ?
3. O nome comercial definitivo será **Borges Eletrônica**?
4. Qual é o número do WhatsApp?
5. Existe telefone para ligações?
6. Qual é o e-mail?
7. Existe oficina aberta ao público?
8. Qual é o endereço?
9. Qual é o horário de atendimento?
10. Thiago atende Campinas e Indaiatuba da mesma forma?
11. Em qual cidade fica a oficina?
12. Há atendimento em domicílio?
13. Há retirada e entrega?
14. Existe taxa de deslocamento?
15. O orçamento é cobrado?
16. O valor da avaliação é descontado quando o serviço é aprovado?
17. Qual é a garantia oferecida?
18. É emitida nota fiscal?
19. Quais formas de pagamento são aceitas?
20. É possível parcelar?

## Serviços

21. Quais tecnologias de TV são atendidas?
22. Quais marcas são atendidas?
23. Há limite de tamanho da TV?
24. Thiago troca painel ou tela quebrada?
25. Quais equipamentos de som são atendidos?
26. Trabalha com áudio profissional?
27. Trabalha com equipamentos vintage?
28. Quais outros equipamentos eletrônicos são aceitos?
29. Quais equipamentos não são aceitos?
30. Faz reparo de placas?
31. Faz laudo para seguro ou dano elétrico?
32. Atende empresas?
33. Possui contratos de manutenção?
34. É autorizado de alguma marca?
35. Possui cursos, certificados ou formação que devem aparecer?

## História e prova social

36. Em que ano Thiago começou a trabalhar com eletrônica?
37. Como começou?
38. Há quanto tempo existe a Borges Eletrônica?
39. Existem fotos antigas ou da trajetória?
40. Existe Perfil da Empresa no Google?
41. Qual é a nota e quantas avaliações existem?
42. Existem depoimentos autorizados?
43. Há casos interessantes para fotografar?
44. Existem clientes empresariais que podem ser citados?
45. Há Instagram, Facebook ou YouTube?

## Marca e site

46. Existe logotipo? (Foi criado um provisório em `assets/img/logo.svg` — ver nota abaixo)
47. Há preferência de cores? (Paleta provisória aplicada conforme spec §10)
48. Existe domínio registrado?
49. Qual domínio será utilizado? (Placeholder atual: `https://www.borgeseletronica.com.br`)
50. O site será hospedado onde?
51. Quem atualizará os dados?
52. Haverá anúncios no Google?
53. O site precisa receber fotos pelo formulário?
54. Haverá integração com ordem de serviço?
55. Qual é o principal diferencial que Thiago deseja comunicar?

---

## Checklist de aceite (espelha a spec §21)

### Conteúdo
- [ ] Todos os dados de contato foram confirmados.
- [ ] O nome "Thiago Borges" foi validado.
- [ ] Serviços e marcas foram revisados pelo técnico.
- [x] Nenhuma promessa não comprovada foi publicada.
- [x] Textos estão em português brasileiro correto.
- [x] "Conserto" está escrito com "s".
- [ ] Campinas e Indaiatuba têm informações reais (hoje: seções na home com `[CONFIRMAR]`).
- [ ] Política de orçamento está clara.
- [ ] Garantia está clara ou foi omitida (hoje: mostrada como pendente).
- [ ] Processo de atendimento corresponde à operação real.
- [x] Avaliações são reais (nenhuma foi inventada; seção mostra aviso honesto).
- [x] Fotos são reais ou claramente ilustrativas (ilustrações SVG com legenda "imagem provisória").

### Interface
- [x] Responsivo a partir de 320 px.
- [x] Menu funciona por teclado e toque.
- [ ] Botões de contato funcionam (dependem do WhatsApp/telefone confirmados).
- [ ] WhatsApp abre com mensagem correta (pronto no código; falta número real).
- [ ] Telefone usa link `tel:` (pronto no código; falta número real).
- [x] Nenhum elemento cobre conteúdo no celular.
- [x] Contraste seguindo a paleta §10.
- [x] Foco visível.
- [x] Imagens possuem dimensões definidas.
- [x] Sem rolagem horizontal.

### SEO
- [x] Título e descrição exclusivos por página.
- [x] H1 exclusivo por página.
- [x] Canonical presente (com domínio placeholder — atualizar quando confirmado).
- [x] Sitemap presente (com domínio placeholder).
- [x] Robots presente.
- [x] JSON-LD presente, sem dados fictícios (telephone/address/opening hours omitidos de propósito).
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

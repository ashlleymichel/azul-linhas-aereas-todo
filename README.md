# Quadro Kanban do Cliente

Quadro estático estilo Trello, pronto para GitHub + Vercel. Possui quatro
colunas, cartões com prazo, prioridade, origem e tags, busca e arrastar e soltar.

## Funciona sem banco

O quadro pode ser publicado imediatamente. Sem configuração adicional, os
cartões ficam salvos no navegador de cada pessoa. Nesse modo, os dados não são
compartilhados entre dispositivos.

Antes de publicar, altere no começo de `index.html`:

```js
const CLIENT_NAME = "Nome do Cliente";
const BOARD_ID = "cliente-01";
```

## Sincronização com Supabase (opcional)

Para compartilhar os mesmos cartões entre pessoas e dispositivos:

1. Crie um projeto em https://supabase.com.
2. Abra **SQL Editor**, cole `supabase-schema.sql` e execute.
3. Abra **Project Settings > API**.
4. Copie a **Project URL** e a chave pública **anon/publishable**.
5. Preencha no começo de `index.html`:

```js
const SUPABASE_URL = "https://seu-projeto.supabase.co";
const SUPABASE_ANON_KEY = "sua-chave-publica";
```

Nunca coloque a chave `service_role` no site. A chave pública `anon` foi criada
para uso no navegador.

## Publicação

Consulte `DEPLOY-GITHUB-VERCEL.md`. O projeto não precisa de instalação,
dependências locais ou comando de build.

## Segurança

Por padrão, o banco aceita leitura e escrita públicas para permitir um quadro
sem login. Qualquer pessoa que conheça o endereço e o identificador do quadro
poderá editar os cartões. Compartilhe o link apenas com as pessoas envolvidas.

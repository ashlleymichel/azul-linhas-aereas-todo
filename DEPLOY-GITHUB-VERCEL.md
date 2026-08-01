# Publicar o quadro com GitHub + Vercel

O quadro pode ser publicado mesmo sem banco. Para sincronização entre
dispositivos, configure o Supabase conforme o `README.md` antes ou depois do deploy.

## Passo 1 — Criar o repositório no GitHub

1. Acesse **https://github.com** e crie uma conta gratuita, se ainda não tiver.
2. Clique no **+** no canto superior direito > **New repository**.
3. Dê um nome, ex: `kanban-cliente`. Pode deixar como **Private** (só você e quem convidar veem o código-fonte — o site publicado continua acessível a qualquer um com o link).
4. Clique em **Create repository**.

## Passo 2 — Subir os arquivos

Forma mais simples (sem usar terminal):

1. No repositório recém-criado, clique em **"uploading an existing file"** (ou **Add file > Upload files**).
2. Arraste todos os arquivos da pasta `kanban-cliente`, incluindo
   `vercel.json`, `supabase-schema.sql` e `.gitignore`.
3. Role para baixo e clique em **Commit changes**.

Se preferir usar terminal/git:

```bash
cd kanban-cliente
git init
git add .
git commit -m "Quadro inicial"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/kanban-cliente.git
git push -u origin main
```

## Passo 3 — Conectar ao Vercel

1. Acesse **https://vercel.com** e clique em **Sign Up** > **Continue with GitHub** (use a mesma conta do GitHub).
2. No painel, clique em **Add New... > Project**.
3. Encontre o repositório `kanban-cliente` na lista e clique em **Import**.
4. Na tela de configuração:
   - **Framework Preset**: deixe como **Other**.
   - **Build Command** e **Output Directory**: pode deixar em branco/padrão — é um site estático simples, não precisa de build.
5. Clique em **Deploy**. Em menos de um minuto o Vercel gera um link público, algo como `https://kanban-cliente.vercel.app`.

Esse é o link que você compartilha com o cliente por email ou Teams.

> Sem Supabase, cada navegador mantém seus próprios cartões. Para colaboração
> em tempo real, preencha `SUPABASE_URL` e `SUPABASE_ANON_KEY` no começo do
> `index.html`, envie a alteração ao GitHub e aguarde o novo deploy.

## Como atualizar depois

Sempre que quiser mudar algo (ex: nome do cliente, cores, etc.):

1. Edite o `index.html`.
2. Suba a versão nova pelo GitHub (pela interface web: abra o arquivo no repositório, clique no lápis ✏️ para editar, ou use **Add file > Upload files** de novo para substituir).
3. O Vercel detecta a mudança automaticamente e publica a nova versão no mesmo link — não precisa reconfigurar nada.

Com GitHub + Vercel, cada alteração fica registrada no histórico e a publicação
é atualizada automaticamente a cada commit enviado para o repositório.

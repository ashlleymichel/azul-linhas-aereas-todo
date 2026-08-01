create extension if not exists pgcrypto;

create table if not exists public.kanban_cards (
  id uuid primary key default gen_random_uuid(),
  board_id text not null,
  title text not null,
  description text not null default '',
  due_date date,
  priority text not null default 'media',
  origin text not null default 'outro',
  tags text[] not null default '{}',
  column_name text not null default 'novo',
  created_at timestamptz not null default now(),
  created_by text,
  last_edited_by text
);

alter table public.kanban_cards enable row level security;

drop policy if exists "Acesso público ao quadro" on public.kanban_cards;

create policy "Acesso público ao quadro"
on public.kanban_cards for all
to anon
using (true)
with check (true);

do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'kanban_cards'
  ) then
    alter publication supabase_realtime add table public.kanban_cards;
  end if;
end $$;

-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.usuarios (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  nome text NOT NULL,
  CONSTRAINT usuarios_pkey PRIMARY KEY (id)
);
CREATE TABLE public.perfis (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  usuario_id bigint NOT NULL,
  bio text,
  CONSTRAINT perfis_pkey PRIMARY KEY (id),
  CONSTRAINT perfis_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id)
);
CREATE TABLE public.turmas (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  nome text NOT NULL,
  CONSTRAINT turmas_pkey PRIMARY KEY (id)
);
CREATE TABLE public.alunos (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  nome text NOT NULL,
  turma_id bigint NOT NULL,
  CONSTRAINT alunos_pkey PRIMARY KEY (id),
  CONSTRAINT alunos_turma_id_fkey FOREIGN KEY (turma_id) REFERENCES public.turmas(id)
);
CREATE TABLE public.disciplinas (
  id bigint GENERATED ALWAYS AS IDENTITY NOT NULL,
  nome text NOT NULL,
  CONSTRAINT disciplinas_pkey PRIMARY KEY (id)
);
CREATE TABLE public.disciplinaDalunos (
  aluno_id bigint NOT NULL,
  disciplina_id bigint NOT NULL,
  CONSTRAINT disciplinaDalunos_aluno_id_fkey FOREIGN KEY (aluno_id) REFERENCES public.alunos(id),
  CONSTRAINT disciplinaDalunos_disciplina_id_fkey FOREIGN KEY (disciplina_id) REFERENCES public.disciplinas(id)
);

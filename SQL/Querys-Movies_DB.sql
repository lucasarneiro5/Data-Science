CREATE DATABASE Filmes
USE Filmes

CREATE TABLE filmes(
id_filme int auto_increment primary key,
filme varchar(255),
genero varchar(255),
nota_especialistas int,
nota_audiencia int,
custo int,
ano int
);
select * from filmes

-- Top 10 filmes do publico
select * from filmes order by nota_audiencia desc limit 10

-- Top 10 avaliados por especialistas
select * from filmes order by nota_especialistas limit 10

-- Filme com maior custo
select filme from filmes order by custo desc limit 1
select * from filmes where custo = (select max(custo) from filmes)

-- Media da nota dos criticos
select avg(nota_especialistas) from filmes

-- Custo medio por filme
select avg(custo) as `Custo Medio por Filme` from filmes

-- Quantos filmes custaram mais do que o custo medio?
select count(*) from filmes where custo > (select avg(custo) from filmes)

-- Quais filmes com nota acima da média da nota dada pela critica?
select filme from filmes where nota_especialistas > (select avg(nota_especialistas) from filmes ) 
order by nota_especialistas desc

-- Quais sao os generos com maior quantidade de filmes
select genero, count(genero) from filmes group by genero order by count(genero) desc

-- Qual genero tem mais alta media de custo
select avg(custo) as `Comedy` from filmes where genero = 'Comedy';
select avg(custo) as `Action` from filmes where genero = 'Action';
select avg(custo) as `Drama` from filmes where genero = 'Drama';
-- Fzer isso para todos os generos de filmes ...

-- Qual genero com mais alta media do publico
select avg(nota_audiencia) as 'Comedy' from filmes where genero = 'Comedy'
select avg(nota_audiencia) as `Action` from filmes where genero = 'Action';
-- Fzer isso para todos os generos de filmes ...

-- Quantidade de filmes produzidos por ano
select ano, count(filme) from filmes group by ano order by count(filme) desc

-- Qual genero produziu mais filmes em 1 ano?
select count(ano) as total, ano, genero from filmes group by ano, genero order by total desc

-- Qual filme mais amado pela audiencia e por especialistas ao mesmo tempo
select filme from filmes order by nota_audiencia desc limit 1
select filme from filmes order by nota_especialistas desc limit 1
-- Temos de cada um, mas queremos pegar a media de ambos
select filme, (nota_especialistas + nota_audiencia)/2 as `Nota_Media` from filmes order by `Nota_Media` desc



-- Contar o numero de homens e mulheres

select genero, count(genero)
from pessoa
group by genero;


-- Contar Idade / Média
	create temporary table idade
		select genero,
				data_nascimento,
				TIMESTAMPDIFF(YEAR, pessoa.data_nascimento, NOW()) AS idade
		from pessoa;
        
        select genero, avg(idade)
        from idade
        group by genero;
        
drop table idade;




--  P1 Quantas pessoas do gênero masculino gostam de cachorro?

select pesquisa.cod_pesquisa, count(cod_pesquisa)
from pesquisa
inner join pessoa
on pesquisa.cod_pessoa = pessoa.cod_pessoa
where pessoa.genero = 'Masculino' and pesquisa.cod_animal_estimacao=4;

-- P2 Qual a média de idade das pessoas do gênero masculino e feminino, respectivamente, que gostam de chá e clima frio?

-- Clima frio = 1
-- Chá = 6
create temporary table idade
		select genero,
				data_nascimento,
				pesquisa.cod_bebida,
                pesquisa.cod_clima,
				TIMESTAMPDIFF(YEAR, pessoa.data_nascimento, NOW()) AS idade
		from pessoa
        inner join pesquisa
         on pesquisa.cod_pessoa = pessoa.cod_pessoa
        where pesquisa.cod_bebida=6 and pesquisa.cod_clima=1;
        
select * from idade;        
        select genero, avg(idade)
        from idade
        group by genero;
        
drop table idade;


-- P3 Qual o hobbie de maior preferência entre as mulheres?
create temporary table teste
select pesquisa.cod_pessoa, cod_hobbie
from pesquisa
inner join pessoa
on pesquisa.cod_pessoa = pessoa.cod_pessoa
where pessoa.genero = 'Feminino';

select cod_hobbie, count(cod_hobbie)
from teste
group by cod_hobbie;

drop table teste;

-- P4 Qual é a média de idade de homens e mulheres que gostam de tartaruga e tem como hobbie escrever
-- Escrever = 5
-- Tartaruga = 2
create temporary table idade
		select genero,
				data_nascimento,
				pesquisa.cod_animal_estimacao,
                pesquisa.cod_hobbie,
				TIMESTAMPDIFF(YEAR, pessoa.data_nascimento, NOW()) AS idade
		from pessoa
        inner join pesquisa
         on pesquisa.cod_pessoa = pessoa.cod_pessoa
        where pesquisa.cod_hobbie=5 and pesquisa.cod_animal_estimacao=2;
        
select * from idade;        
        select genero, avg(idade)
        from idade
        group by genero;
        
drop table idade;

-- P5 Qual a bebida favorita entre os homens e mulheres, respectivamente?

create temporary table teste
select pesquisa.cod_pessoa, cod_bebida, pessoa.genero
from pesquisa
inner join pessoa
on pesquisa.cod_pessoa = pessoa.cod_pessoa;
-- where pessoa.genero = 'Feminino';
select * from teste;

select cod_bebida, count(cod_bebida)
from teste
where genero = 'Masculino'
group by cod_bebida;

-- Café = 2

select cod_bebida, count(cod_bebida)
from teste
where genero = 'Feminino'
group by cod_bebida;

-- Cerveja = 1
drop table teste;


-- P6 Quantas pessoas tem como Hobbie assistir TV, e qual a sua média de idade?
-- Assistir TV = 2
-- 

-- Contar Idade / Média
	create temporary table idade
		select pesquisa.cod_hobbie,
				TIMESTAMPDIFF(YEAR, pessoa.data_nascimento, NOW()) AS idade
		from pessoa
        inner join pesquisa
        on pesquisa.cod_pessoa = pessoa.cod_pessoa
        where pesquisa.cod_hobbie = 2;
  
  select * from idade;
        select *, avg(idade)
        from idade;
        
drop table idade;



-- P8 Qual script abaixo retorna o número de homens e mulheres que nasceram a partir do mês de outubro de 1990 e que gostam de Água?

select genero, beb.bebida, count(pes.cod_pessoa) as qtd
from pesquisa p
join pessoa pes on p.cod_pessoa = pes.cod_pessoa
join bebida beb on beb.cod_bebida = p.cod_bebida
where pes.data_nascimento >= '1990-10-01'
and beb.bebida = 'água'
group by pes.genero, beb.bebida;


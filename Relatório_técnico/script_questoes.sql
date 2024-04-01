--questão 1
select * 
from municipio 
inner join estado  
on estado.codestado = municipio.codestado 
where codregiao = 1;

--2° questão
select nomemunicipio,
count(m.codmunicipio) as repeticoes
from estado as e
inner join municipio as m
on m.codestado = e.codestado
group by m.nomemunicipio
having count(nomemunicipio) > 1;


-- 3° questão
select avg(municipios_por_regiao) as Media_municipios_por_regiao
from(
    select count(codmunicipio) as municipios_por_regiao, codregiao
    from municipio  as m 
    inner join estado as e
    on m.codestado = e.codestado
    group by codregiao
);

-- 4ª questão

select e.siglaestado as sigla, count(codmunicipio) as "quantidade de municipios" from estado as e
inner join municipio as mu on mu.codestado = e.codestado
group by sigla;

-- 5ª questão
select mu.nomemunicipio as "Município", idh_longevidade as "Longevidade" from indice as i
inner join municipio as mu on i.codmunicipio = mu.codmunicipio
where idh_longevidade = (select max(idh_longevidade) from indice where ano = 2000); 


--questão 6



--questão 7
select codmunicipio, idh_renda
from indice
order by idh_renda desc
limit 1;

--questao 8
select nomeestado
from estado as e1
inner join 
(
    select distinct codestado
    from municipio as m1
    inner join 
    (
        select codmunicipio, idh_renda
        from indice
        where idh_geral > 0.8
    ) as m2
    on m1.codmunicipio = m2.codmunicipio
) as e2
on e1.codestado = e2.codestado;


--questão 9
select max(idh_educacao) as idh_educacao, codestado 
from municipio 
inner join indice 
on municipio.codmunicipio = indice.codmunicipio
group by codestado
order by codestado;

--questão 10
select *
from 
(
        select i.ano, m.nomemunicipio,idh_geral as idh_geral_91, 
        idh_renda as idh_renda_91, 
        idh_longevidade as idh_longevidade_91, 
        idh_educacao as idh_educacao_91
        from indice as i
        inner join municipio as m
        on m. codmunicipio = i.codmunicipio
        where m.codestado = 5 and i.ano = 1991
    union
        select i.ano, m.nomemunicipio,idh_geral as idh_geral_00, 
        idh_renda as idh_renda_00, 
        idh_longevidade as idh_longevidade_00, 
        idh_educacao as idh_educacao_00
        from indice as i
        inner join municipio as m
        on m. codmunicipio = i.codmunicipio
        where m.codestado = 5 and i.ano = 2000
    )
order by nomemunicipio, ano
;

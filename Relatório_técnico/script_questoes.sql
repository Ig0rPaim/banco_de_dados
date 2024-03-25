
-- 3° questão
select avg(municipios_por_regiao) as Media_municipios_por_regiao
from(
    select count(codmunicipio) as municipios_por_regiao, codregiao
    from municipio  as m 
    inner join estado as e
    on m.codestado = e.codestado
    group by codregiao
);


--2° questão
select nomemunicipio,
count(m.codmunicipio) as repeticoes
from estado as e
inner join municipio as m
on m.codestado = e.codestado
group by m.nomemunicipio
having count(nomemunicipio) > 1;



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
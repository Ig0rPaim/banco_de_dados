CREATE MATERIALIZED VIEW Arrecadacao_Total AS
    SELECT 
        L.NOME AS Nome_Linha,
        L.NUMERO AS Numero_Linha,
        COUNT(V.ID) AS Viagens_Feitas,
        SUM(TP.PRECO) AS Arrecadacao_Total
    FROM 
        Linha AS L
    JOIN 
        Linha_Viagem AS LV ON L.ID = LV.idLinha
    JOIN 
        Viagem AS V ON LV.idViagem = V.ID
    JOIN 
        Passagem_Viagem AS PV ON V.ID = PV.idViagem
    JOIN 
        Passagem AS P ON PV.idPassagem = P.ID
    JOIN 
        Tipo_Passagem AS TP ON P.idTipo_Passagem = TP.ID
    GROUP BY 
        L.NOME;
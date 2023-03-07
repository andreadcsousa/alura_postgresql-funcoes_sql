/*
    Sintaxes diferentes

    Neste vídeo nós vimos as diferentes formas de realizar um INSERT no banco de dados.

    Levando em consideração uma tabela chamada pessoa com os campos id, nome e nascimento, qual das sintaxes a seguir está INCORRETA?
*/

INSERT INTO pessoa VALUES (‘Vinicius Dias’, ‘1997-10-15’);

Se a tabela tem 3 campos, todos precisam receber valores, caso contrário retornarão erro na inserção.



/*
    Buscando com IN

    O operador IN compara algo com todos os valores presentes em uma lista.
    Busque na tabela aluno os registros com nome igual a ’Vinicius’, ‘Diogo’ ou ‘Patricia’?
*/

SELECT * FROM aluno WHERE nome IN ('Vinicius', 'Diogo', 'Patricia');



/*
    Equivalentes

    Como citado no vídeo, na maioria das ocasiões uma sub-query pode ser substituído pelo uso do HAVING.
    Pense e monte a query equivalente a mostrada abaixo utilizando subquery:

    SELECT curso.nome,
        COUNT(aluno_curso.aluno_id) numero_alunos
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    GROUP BY 1
    HAVING COUNT(aluno_curso.aluno_id) > 2
    ORDER BY numero_alunos DESC;
*/

SELECT
    curso,
    numero_alunos
FROM (
    SELECT
        curso.nome AS curso,
        COUNT(aluno_curso.aluno_id) AS numero_alunos
    FROM curso
    JOIN aluno_curso ON aluno_curso.curso_id = curso.id
    GROUP BY 1
) AS alunos
WHERE numero_alunos > 2
ORDER BY numero_alunos DESC;
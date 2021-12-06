use  SP_MADICAL_GRUP_Fe
go

SELECT nomeUsuario 'Nome do Paciente', emailUsuario 'Email do paciente', titulotipoUsuario 'tipo de usu�rio', RG
FROM usuario u
INNER JOIN paciente p
ON u.idUsuario = p.idUsuario
INNER JOIN tipoUsuario tu
ON tu.idTipoUsuario = u.idTipoUsuario

SELECT *
FROM usuario u
INNER JOIN medico m
ON u.idUsuario = m.idUsuario

SELECT nomeUsuario, emailUsuario, RG, ISNULL (Telefone, 'N�o cadastrado') Telefone, enderecoPaciente
FROM usuario u
INNER JOIN paciente
ON u.idUsuario = paciente.idUsuario

SELECT UP.nomeUsuario Paciente, 
	   UM.nomeUsuario Medico,
	   E.tipoEspecializacao Especializa��o,
	   CONVERT(VARCHAR(25), C.dataConsulta, 113) 'Data da Consulta',
	   S.descricao Situa��o,
	   C.descricaoConsulta 'Descricao da consulta' 
  FROM CONSULTA C
 INNER JOIN SITUACAO S
    ON C.idSituacao = S.idSituacao
 INNER JOIN PACIENTE P
    ON C.idPaciente = P.idPaciente
 INNER JOIN MEDICO M
    ON C.idMedico = M.idMedico 
 INNER JOIN ESPECIALIZACAO E
    ON M.idEspecializacao = E.idEspecializacao
 INNER JOIN USUARIO UP
    ON P.idUsuario = UP.idUsuario
 INNER JOIN USUARIO UM
    ON M.idUsuario = UM.idUsuario;
GO



SELECT COUNT(idUsuario) 'Quantidade de Usuarios' FROM usuario;
GO


CREATE FUNCTION MED_ESPECIALIZACAO(@tipoEspec VARCHAR(90))
RETURNS TABLE
     AS
 RETURN (
          SELECT @tipoEspec AS especializacao, COUNT(idEspecializacao) 'C�digo M�dico'
		    FROM ESPECIALIZACAO
		   WHERE tipoEspecializacao LIKE '%' + @tipoEspec + '%'
        )
GO
SELECT * FROM MED_ESPECIALIZACAO('Psiquiatria');
GO


CREATE PROCEDURE  IdadePaciente
@idade VARCHAR(30)
    AS
 BEGIN
SELECT nomeUsuario, DATEDIFF(YEAR, dataNasc,GETDATE())
    AS idade
  FROM USUARIO U
 INNER JOIN PACIENTE P
    ON U.idUsuario = P.idUsuario
 WHERE nomeUsuario = @idade
   END;
GO


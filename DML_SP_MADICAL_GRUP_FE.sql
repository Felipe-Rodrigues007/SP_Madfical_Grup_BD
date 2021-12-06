USE SP_MADICAL_GRUP_Fe
go
insert into especializacao
values ('Acupuntura'),('Anestesiologia'),('Angiologia'),('Cardiologia'),('Cirurgia Cardiovascular'),('Cirurgia da m�o'),('Cirurgia do aparelho digestivo'),
('Cirurgia Geral'),('Cirurgia Pedi�trica'),('Cirurgia Pl�stica'),('Cirurgia Tor�cica'),('Cirurgia Vascular'),('Dermatologia'),('Radioterapia'),('Urologia'),
('Pediatria'), ('Psiquiatria');

insert into tipoUsuario
values ('Admin'), ('usuario'), ('M�dico')

insert into instituicao (nomeInstuicao, endereco, razaoSocial, CNPJ)
values ('Clinica Possarle', 'Av. Bar�o Limeira, 532, S�o Paulo, SP', 'SP Medical Group', '86.400.902/0001-30');

insert into situacao
values ('realizada'), ('agendada'), ('cancelada ');

insert into usuario (idTipoUsuario, nomeUsuario, emailUsuario, SenhaUsuario)
values (3, 'Ricardo Lemos', 'ricardo.lemos@spmedicalgroup.com.br', '1234'), (3, 'Roberto Possarle', 'roberto.possarle@spmedicalgroup.com.br', '1234'), (3, 'Helena Strada', 'helena.souza@spmedicalgroup.com.br', '1234'),
	   (2, 'Ligia', 'Ligia@email.com', '1234'), (2, 'Alexandre', 'Alexandre@email.com', '1234'), (2, 'Fernando', 'Fernando@email.com', '1234'), (2, 'Henrique', 'Henrique@email.com', '1234'), (2, 'Jo�o', 'Jo�o@email.com', '1234'), (2, 'Bruno', 'Bruno@email.com', '1234'), (2, 'Mariana', 'Mariana@email.com', '1234'),
	   (1, 'Felipe', 'Fe@email.com', '1234');

insert into paciente(idUsuario, datanasc, RG, CPF, Telefone, enderecoPaciente)
values (4, '13-10-1983', '43522543-5', '94839859000','11 3456-7654', 'Rua Estado de Israel 240, S�o Paulo, Estado de S�o Paulo, 04022-000'), (5, '23-07-2001', '32654345-7', '73556944057', '11 98765-6543', 'Av. Paulista, 1578 - Bela Vista, S�o Paulo - SP, 01310-200'),
(6, '10-10-1978', '54636525-3', '16839338002','11 97208-4453', 'Av. Ibirapuera - Indian�polis, 2927,  S�o Paulo - SP, 04029-200'),(7, '13/10/1985', '54366362-5', '14332654765','11 3456-6543-5', 'R. Vit�ria, 120 - Vila Sao Jorge, Barueri - SP, 06402-030'),
(8, '27/08/1975', '53254444-1', '91305348010', '11 7656-6377', 'R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeir�o Pires - SP, 09405-380'), (9, '21/03/1972', '54566266-7', '79799299004','11 95436-8769', 'Alameda dos Arapan�s, 945 - Indian�polis, S�o Paulo - SP, 04524-001'),
(10, '05/03/2018', '54566266-8', '13771913039', null, 'R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140');

insert into medico(idUsuario, idEspecializacao, idInstituicao, CRM)
values (1, 2, 1, '54356-SP'), (2, 17, 1, '53452-SP'), (3, 16, 1, '65463-SP');

insert into consulta(idMedico, idSituacao, idPaciente, dataConsulta, descricaoConsulta)
values (3, 1, 7, '20/01/2020  15:00:00', 'A paciente est� completamente saud�vel!'), (2, 3, 2, '06/01/2020  10:00:00', 'Consulta cancelada!'), (2, 1, 3, '07/02/2020  11:00:00', 'O paciente est� saud�vel!'), (2, 1, 2, '06/02/2018  10:00:00', 'O paciente teve uma melhora, por�m, necessitar� retorno!'),
(1, 3, 4, '07/02/2019  11:00:45', 'A consulta foi cancelada!'), (3, 2, 4, '08/03/2020  15:00:00', 'A consulta foi agendada!'), (1, 2, 4, '09/03/2020  11:00:45', 'A consulta foi agendada!');
GO



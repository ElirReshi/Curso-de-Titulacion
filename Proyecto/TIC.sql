/*
    Sander ALberto Pacheco H. -- Responsable del aula TIC
*/

create database Tic

use Tic
go

create table maquina (
  NumMaquina int primary key,
  Modelo varchar(50),
  CPU varchar(30),
  Ram int,
  DiscoDuro varchar(10),
  TarjetaGrafica varchar(50),
  MasDetalles varchar(Max)
)

create table responsable (
  NumResponsable int primary key,
  NumCedula varchar (16),
  Nombre varchar(max),
  ApellidoPaterno varchar(max),
  ApellidoMaterno varchar(max),
  NumEmergencia int,
  NumCelular int,
  NumFijo int,
  Direccion varchar(max)
)

create table control (
  IdControl int primary key,
  NumMaquina int foreign key references maquina (NumMaquina) not null,
  NumResponsable int foreign key references responsable (NumResponsable) not null,
  TipoMantenimiento varchar(max), -- Correctivo, Preventivo, Predictivo, Cero Horas (Overhaul), En Uso
  Justificacion varchar(max),
  Desperfecto varchar(max),
  FechaReg date default getdate()
)

create table profesor (
  NumProfesor int primary key,
  NumCedula varchar (16),
  Nombre varchar(max),
  ApellidoPaterno varchar(max),
  ApellidoMaterno varchar(max),
  NumCelular int
)

create table asignatura (
  CodAsignatura char(10) primary key,
  Nombre varchar (max)
)

create table material_escolar (
  IdMaterial int primary key,
  CodAsignatura char (10) foreign key references asignatura (CodAsignatura) not null,
  Nombre varchar (max),
  Extension varchar(max), -- .pdf, ...
  Tipo varchar (max), -- media, audio, interactivo, manual, projectos, introductorio
  Vigente bit
)

create table grupo (
  CodGrupo char(10) primary key, -- 7A, 7B, 7C, 8A, ...
  Grupo varchar (max),
  FechaReg date default getdate(),
  Vigente bit
)

create table leccion (
  IdLeccion int primary key,
  NumResponsable int foreign key references responsable (NumResponsable) not null,
  NumProfesor int foreign key references profesor (NumProfesor) not null,
  CodAsignatura char(10) foreign key references asignatura (CodAsignatura) not null,
  CodGrupo char(10) foreign key references grupo (CodGrupo) not null,
  -----
  Nivel varchar (max), -- Preescolar, Primaria, Secundaria ; Pre, Pri, Sec
  CantHombre int,
  CantMujer int,
  Turno varchar(max), -- matutino, vespertino, sabatino
  FechaReg date default getdate()
)

create table horario (
    IdHorario int primary key,
    
    -----
    FechaApartado date,
    Bloque int, /*bloque 1, bloque 2*/
    TipoBloque varchar(max), -- doble, individual
    FechaReg date default getdate()
)

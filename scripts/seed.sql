CREATE TABLE "Matricula"
(
    "id" SERIAL PRIMARY KEY,
    "fecha_matricula" date,
    "id_alumno" int,
    "id_modalidad" int,
    "id_curso" int,
    "materia_retrasada" varchar,
    "id_instituto_procedente" int,
    "datos_academicos" varchar
);

CREATE TABLE "DocumentosMatricula"
(
    "documento_id" SERIAL PRIMARY KEY,
    "matricula_id" int
);

CREATE TABLE "Documento"
(
    "id" SERIAL PRIMARY KEY,
    "name" varchar
);

CREATE TABLE "Instituto"
(
    "id" SERIAL PRIMARY KEY,
    "name" varchar
);

CREATE TABLE "Curso"
(
    "id" SERIAL PRIMARY KEY,
    "seccion" varchar
);

CREATE TABLE "Modalidad"
(
    "id" SERIAL PRIMARY KEY,
    "Nombre" varchar
);

CREATE TABLE "Alumno"
(
    "id" SERIAL PRIMARY KEY,
    "id_persona" int,
    "id_referencia" int
);

CREATE TABLE "Persona"
(
    "id" SERIAL PRIMARY KEY,
    "Nombre" varchar,
    "Apellido" varchar,
    "Lugar_Nacimiento" varchar,
    "Fecha_Nacimiento" date,
    "Genero" varchar,
    "Nacionalidad" varchar,
    "Direccion" varchar,
    "Telefono" varchar,
    "Tipo_Sangre" varchar,
    "Fotografia" varchar
);

CREATE TABLE "Referencia"
(
    "id" SERIAL PRIMARY KEY,
    "Nombre_Encargado" varchar,
    "LugarTrabajo" varchar,
    "Telefono" varchar,
    "CasaPropia" boolean
);

CREATE TABLE "D_Salud"
(
    "id" SERIAL PRIMARY KEY,
    "id_alumno" int,
    "Vacuna" boolean
);

CREATE TABLE "D_SaludDetalle"
(
    "id_DSalud" int,
    "id_EnfermedadPadece" int,
    "Tratamiento" varchar,
    "id_EnfermedadPadecio" varchar,
    PRIMARY KEY ("id_DSalud", "id_EnfermedadPadece")
);

CREATE TABLE "Enfermedad"
(
    "id" SERIAL PRIMARY KEY,
    "Nombre" varchar
);

ALTER TABLE "Matricula" ADD FOREIGN KEY ("id_alumno") REFERENCES "Alumno" ("id");

ALTER TABLE "Matricula" ADD FOREIGN KEY ("id_modalidad") REFERENCES "Modalidad" ("id");

ALTER TABLE "Matricula" ADD FOREIGN KEY ("id_curso") REFERENCES "Curso" ("id");

ALTER TABLE "Matricula" ADD FOREIGN KEY ("id_instituto_procedente") REFERENCES "Instituto" ("id");

ALTER TABLE "Alumno" ADD FOREIGN KEY ("id_persona") REFERENCES "Persona" ("id");

ALTER TABLE "Alumno" ADD FOREIGN KEY ("id_referencia") REFERENCES "Referencia" ("id");

ALTER TABLE "D_Salud" ADD FOREIGN KEY ("id_alumno") REFERENCES "Alumno" ("id");

ALTER TABLE "D_SaludDetalle" ADD FOREIGN KEY ("id_DSalud") REFERENCES "D_Salud" ("id");

ALTER TABLE "D_SaludDetalle" ADD FOREIGN KEY ("id_EnfermedadPadece") REFERENCES "Enfermedad" ("id");

CREATE DATABASE db_from_diagram;

CREATE TABLE "medical_histories"(
    "id" SERIAL PRIMARY KEY,
    "admited_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL
);

CREATE INDEX "medical_histories_patient_id_index" ON
    "medical_histories"("patient_id");
    

CREATE TABLE "patients"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);
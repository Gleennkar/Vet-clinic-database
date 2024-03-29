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

CREATE TABLE "invoices"(
    "id" SERIAL PRIMARY KEY,
    "total_amount" DECIMAL(8, 2) NOT NULL,
    "generated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "payed_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" INTEGER NOT NULL
);

CREATE INDEX "invoices_medical_history_id_index" ON
    "invoices"("medical_history_id");
CREATE INDEX "invoices_medical_history_id_index" ON
    "invoices"("medical_history_id");
    
CREATE TABLE "invoice_items"(
    "id" SERIAL PRIMARY KEY,
    "unit_price" DECIMAL(8, 2) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "treatment_id" INTEGER NOT NULL
);
CREATE INDEX "invoice_items_invoice_id_index" ON
    "invoice_items"("invoice_id");
CREATE INDEX "invoice_items_treatment_id_index" ON
    "invoice_items"("treatment_id");
    
CREATE TABLE "treatments"(
    "id"SERIAL PRIMARY KEY,
    "type" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL
);

ALTER TABLE
    "medical_histories" ADD CONSTRAINT "medical_histories_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "patients"("id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "invoices"("id");
ALTER TABLE
    "invoices" ADD CONSTRAINT "invoices_medical_history_id_foreign" FOREIGN KEY("medical_history_id") REFERENCES "medical_histories"("id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_treatment_id_foreign" FOREIGN KEY("treatment_id") REFERENCES "treatments"("id");

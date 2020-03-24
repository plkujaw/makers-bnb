CREATE TABLE "public"."users" ("id" serial PRIMARY KEY,"name" varchar(60),"email" varchar(60), "password" varchar(60));
ALTER TABLE "public"."spaces" ADD COLUMN "owner_id" INTEGER REFERENCES users (id);

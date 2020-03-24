ALTER TABLE "public"."spaces" RENAME COLUMN "address" TO "street_address";
ALTER TABLE "public"."spaces" ADD COLUMN "country" varchar(50)
ALTER TABLE "public"."spaces" ADD COLUMN "city" varchar(50)
ALTER TABLE "public"."spaces" ADD COLUMN "postcode" varchar(10)

/*
  Warnings:

  - You are about to drop the column `organization_id` on the `invites` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email,author_id]` on the table `invites` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `author_id` to the `invites` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "invites" DROP CONSTRAINT "invites_organization_id_fkey";

-- DropIndex
DROP INDEX "invites_email_organization_id_key";

-- AlterTable
ALTER TABLE "invites" DROP COLUMN "organization_id",
ADD COLUMN     "author_id" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "invites_email_author_id_key" ON "invites"("email", "author_id");

-- AddForeignKey
ALTER TABLE "invites" ADD CONSTRAINT "invites_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "organizations"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

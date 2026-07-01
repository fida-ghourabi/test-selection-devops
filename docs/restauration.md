 🔄 Projet DevOps — Restauration complète Odoo

## 📌 Objectif

Ce document décrit la procédure complète de restauration d’un système Odoo après u>

Le système comprend :
- Odoo (application)
- PostgreSQL (base de données)
- Filestore Odoo (fichiers utilisateurs et pièces jointes)

---

# 💥 1. Simulation de crash (perte totale)

```bash
docker compose down -v
# 💥 2. Redémarrage de l’infrastructure
docker compose up -d

# 💥 3. Restauration de la base de données PostgreSQL
docker cp backups/db_YYYYMMDD_HHMMSS.sql apps-db-1:/tmp/dump.sql

docker exec -it apps-db-1 psql -U odoo -d odoodb -f /tmp/dump.sql

# 💥 3. Restauration du filestore Odoo
cd apps/backups

tar -xzf ~/test-selection-devops/apps/backups/backup_20260701_161508.tar.gz -C ~/test-selection-devops/apps/backups

docker cp backups/filestore_YYYYMMDD_HHMMSS/. apps-odoo-1:/var/lib/odoo

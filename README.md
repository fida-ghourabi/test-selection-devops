# 🧩 Odoo DevOps Project — Backup & Restore (Docker)

## 📌 Description

Ce projet déploie une application **Odoo 17** avec :
- PostgreSQL (base de données)
- Nginx (reverse proxy)
- Docker Compose

Il inclut :
- sauvegarde automatique (backup)
- restauration complète après crash
- journalisation
- gestion du filestore Odoo

---

# ⚙️ Prérequis

Installer sur la machine :

- Docker
- Docker Compose
- Git
- WSL (si Windows)

Vérifier :

```bash
docker --version
docker compose version
git --version
```

---

# 🚀 Démarrage du projet (DE ZÉRO)

Depuis la racine :

```bash id="step1"
cd apps
```

```bash id="step2"
docker compose up -d
```

```bash id="step3"
docker ps
```

```bash id="step4"
http://erp.local
```

👉 OU :

```text id="step5"
http://localhost:8069
```

✔ Stack opérationnelle en moins de 5 commandes

---

# 💾 Backup (Sauvegarde)

Rendre le script exécutable :

```bash id="b1"
chmod +x backup.sh
```

Exécuter la sauvegarde :

```bash id="b2"
./backup.sh
```

📁 Résultat :

```
apps/backups/
```

Le script sauvegarde :
- PostgreSQL (pg_dump)
- Filestore Odoo
- Archive `.tar.gz`
- Logs dans `/var/log/backup.log`

---

# 🔁 Restauration

## 💥 1. Simulation crash

```bash id="r1"
docker compose down -v
```

---

## 🚀 2. Relancer la stack

```bash id="r2"
docker compose up -d
```

---

## 🗄️ 3. Restaurer la base de données

La procédure détaillée de restauration est disponible dans :

```
docs/restauration.md
```

## 🌐 6. Vérification

```text id="r9"
http://erp.local
```

ou

```text id="r10"
http://localhost:8069
```


---

# 📸 Screenshots

Les captures sont disponibles dans :

```
docs/screenshots/
```

Exemples :
- backup OK
- crash (docker down -v)
- restore DB
- restore filestore
- Odoo fonctionnel

---

# 🧠 Journal IA

Le journal d’utilisation de l’IA est disponible ici :

```
docs/journal-ia.md
```

---

# 📂 Structure du projet

```
.
├── apps/
│   ├── backup.sh
│   ├── backups/
│   ├── docker-compose.yml
│   └── nginx/
├── docs/
│   ├── restauration.md
│   ├── journal-ia.md
│   └── screenshots/
├── README.md
└── .gitignore
```

---

# 🚫 .gitignore

```
backups/
*.log
.env

```

---

# ✅ Conclusion

✔ Déploiement Odoo OK  
✔ Backup automatique OK  
✔ Restore complet OK  
✔ Simulation crash OK  
✔ Documentation complète OK  

---

# 📌 Auteur

Projet DevOps — Backup & Restore Odoo (Docker + PostgreSQL)

# 🧠 Journal IA — Projet DevOps Odoo Backup & Restore

## 📌 Objectif

Ce document retrace l’utilisation de l’IA pendant le développement du projet :
- backup Odoo
- restauration complète
- Docker + PostgreSQL
- filestore management

---

# 🧩 Prompt 1 — Script de backup Odoo

## 🗨️ Prompt utilisé

> "Écrire un script bash backup.sh qui fait pg_dump via docker exec, sauvegarde le filestore Odoo et crée une archive horodatée"

## 🤖 Réponse de l’IA

L’IA a généré un script avec :
- `docker exec pg_dump`
- `docker cp` pour filestore
- `tar.gz` horodaté
- logs dans `/var/log/backup.log`

## ✏️ Modifications effectuées

- J’ai corrigé les noms des conteneurs (`apps-db-1`, `apps-odoo-1`)
- J’ai simplifié le chemin du filestore
- J’ai adapté la structure pour mon projet réel

## 🎯 Pourquoi

Adapter le script à mon environnement Docker réel pour éviter les erreurs d’exécution.

---

# 🧩 Prompt 2 — Restauration PostgreSQL + filestore

## 🗨️ Prompt utilisé

> "Comment restaurer une base PostgreSQL et un filestore Odoo après docker compose down -v"

## 🤖 Réponse de l’IA

L’IA a proposé :
- `docker cp` du dump SQL
- `createdb`
- `psql -f dump.sql`
- restauration du filestore dans `/var/lib/odoo`

## ✏️ Modifications effectuées

- J’ai corrigé le nom de la base (`odoodb`)
- J’ai corrigé le chemin exact du filestore Odoo
- J’ai adapté les commandes à mes containers réels

## 🎯 Pourquoi

Les chemins et noms varient selon les projets Docker, donc adaptation obligatoire.

---

# 🧩 Prompt 3 — Résolution erreurs Docker (docker cp / filestore)

## 🗨️ Prompt utilisé

> "docker cp error lstat no such file or directory filestore Odoo"

## 🤖 Réponse de l’IA

L’IA a expliqué :
- erreurs de chemin Docker
- mauvaise cible container
- importance de vérifier `docker ps`
- structure du filestore Odoo

## ✏️ Modifications effectuées

- J’ai corrigé les commandes `docker cp`
- J’ai recréé le conteneur Odoo avant copie


## 🎯 Pourquoi

Les erreurs venaient d’un conteneur arrêté ou mauvais chemin.

---

# 📚 Ce que j’ai appris aujourd’hui

Aujourd’hui, j’ai appris à :
- gérer un système complet Odoo avec Docker
- automatiser des backups avec Bash
- restaurer une base PostgreSQL après crash
- manipuler le filestore Odoo correctement
- comprendre les erreurs Docker (cp, containers absents, volumes)

---

# 🧠 Conclusion

L’IA m’a permis de :
- gagner du temps sur les scripts
- comprendre les commandes Docker avancées
- corriger mes erreurs rapidement

Mais j’ai dû adapter chaque réponse à mon environnement réel pour que le projet fonctionne correctement.

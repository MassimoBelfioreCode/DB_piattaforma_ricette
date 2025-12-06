# DB_piattaforma_ricette
Progetto per il corso universitario di Basi di Dati. DBMS: MySQL.
Il file Massimo_Belfiore_X81001087_relazioneprogetto.pdf contiene la documentazione del progetto.

---
Questo progetto consiste nella progettazione e quindi realizzazione del database relazionale per una piattaforma di ricette di cucina italiane e gestione delle recensioni.
Include la progettazione, la creazione delle tabelle, il popolamento dei dati, una serie di query SQL dimostrative e uno script php che mostra la ricetta del giorno.
---

Il Database realizzato è stato ottimizzato tramite l'aggiunta di indici.
È Possibile inoltre effettuare sul database operazioni di DML e DLL.

**Tecnologie utilizzate**
- **MySQL** (DBMS)  
- **phpMyAdmin** per la gestione del database  
- **MySQL Workbench** per la progettazione e il diagramma ER  
- **Apache + PHP** come ambiente server locale  
- **SQL (DDL + DML)** per la definizione e manipolazione dei dati  

Il database da me creato supporta tutte le principali operazioni SQL:  
- creazione e gestione tabelle (DDL)  
- inserimento, modifica e cancellazione dati (DML)
- relazioni tra entità tramite chiavi primarie ed esterne  
- ecc...
---

Contenuto degli script
---
«» Lo script db_ricette.sql contiene il codice per creare il database.

«» Lo script operazioni.sql contiene l’implementazione in SQL delle operazioni previste.

«» Lo script trigger.sql contiene dei trigger.

«» Lo script homepage_piattaforma_ricette.php contiene il codice per visualizzare sul Web Browser dell'utente la ricetta del giorno.


**Utilizzare il Database**
Istruzioni:

1. Apri **phpMyAdmin** o **MySQL Workbench**.  
2. Crea un nuovo database, ad esempio:  
   ```sql
   CREATE DATABASE piattaforma_ricette;

3. Importa il file ricette.sql.
4. Esegui le query dimostrative presenti in operazioni.sql.

Alternativamente è possibile utilizzare MySQL CLI prima installandolo sulla propria macchina e successivamente creando un utente.
--> Istruzioni su come configurare un database MySQL utilizzando la shell mysql:

1. Avviate mysql dalla riga di comando della shell:
2. mysql -u root -p
   Inserisci Password: metti la password
3. Create un nuovo utente per il database("nome database") e la relativa password("nome password")
   CREATE USER 'duser'@'localhost' IDENTIFIED BY 'nome password';
4. Create un nuovo database per il progetto("db_piattaforma_ricette"):
   CREATE DATABASE db_piattaforma_ricette;
5. Adesso potete concedere sostanzialmente al nuovo utente che avete creato i diritti di accesso al nuovo database con:
   GRANT ALL ON db_piattaforma_ricette.* TO 'duser'@'localhost';

---
Esempio di query:

--Ricerca di una ricetta in base agli ingredienti

SELECT R.id_ricetta, R.titolo, R.id_categoria, R.numero_recensioni, R.dosi_per, R.preparazione,
        R.senza_glutine, R.senza_lattosio, R.gourmet, R.media_apprezzamento
FROM ricetta R, contiene C, ingrediente I
WHERE R.id_ricetta = C.id_ricetta AND C.id_ingrediente = I.id_ingrediente AND
      I.nome = "Spaghetti" AND
      C.quantita < "350g"


   CREATE DATABASE piattaforma_ricette;

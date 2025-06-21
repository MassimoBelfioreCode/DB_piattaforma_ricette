# DB_piattaforma_ricette
DB relazionale piattaforma di condivisione di ricette online e gestione delle recensioni. DBMS: MySQL.

Descrizione del progetto: 

Questo progetto implementa un database relazionale per la gestione delle funzionalità tipiche di una piattaforma di condivisione di ricette online, come:

    - la gestione degli utenti e delle recensioni

    - la pubblicazione di ricette

    - la ricerca di ricette italiane in base agli ingredienti disponibili

    - il filtraggio dei risultati in base a intolleranze alimentari (es. glutine, lattosio)

Il database supporta operazioni di tipo DDL (Data Definition Language) e DML (Data Manipulation Language) in linguaggio SQL.

Istruzioni:
Importa `creazione_db.sql` nel tuo DBMS MySQL per creare il database.

È possibile consultare il file .pdf che contiene la relativa documentazione sulla progettazione del database.
I file operazioni.txt e trigger.txt contengono rispettivamente operazioni che sono possibili effettuare sul database ed esempio di trigger.

e.g. di query nel file operazioni.txt:

SELECT R.id_ricetta, R.titolo, R.id_categoria, R.numero_recensioni, R.dosi_per, R.preparazione,
        R.senza_glutine, R.senza_lattosio, R.gourmet, R.media_apprezzamento
FROM ricetta R, contiene C, ingrediente I
WHERE R.id_ricetta = C.id_ricetta AND C.id_ingrediente = I.id_ingrediente AND
      I.nome = "Spaghetti" AND
      C.quantita < "250g"


--implementazione di trigger

-- T1: implementazione di un trigger che permetta di aumentare il numero di recensioni di 1 nel
-- momento in cui un utente registrato crea una nuova recensione per una ricetta
-- 
CREATE TRIGGER increase_reviews
after insert on recensione
for each row
UPDATE ricetta
set numero_recensioni = numero_recensioni + 1
where ricetta.id_ricetta = new.id_ricetta


-- T2: implementazione di un trigger che permetta di evitare che un utente registrato inserisca
--     una recensione di una ricetta pubblicata da egli stesso.




-- T3: implementazione di un trigger che calcoli la media_apprezzamento di una ricetta ogni volta che
--     venga inserita una nuova recensione


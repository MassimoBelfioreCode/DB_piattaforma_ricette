------Operazioni previste database


--O1: Aggiunta di una ricetta
INSERT INTO ricetta (id_ricetta, titolo, numero_recensioni, gourmet, id_categoria, media_apprezzamento, senza_glutine, senza_lattosio,
                            data_pubblicazione, nickname, dosi_per, preparazione) 
                            VALUES(41, "Risotto birra e speck", 0, 0, 2, NULL, 'F', 'F', "2019/03/01", "Barbieri912", 4, "Per realizzare il 
                            risotto birra e speck iniziate sbucciando la cipolla bianca, e poi tritatela finemente Ora prendete la fetta di speck
                            e riducetela a dadini molto piccoli Ponete sul fuoco una padella larga, sciogliete il burro e poi unite la cipolla 
                            tritata fate appassire la cipolla per almeno 10 minuti, poi aggiungete i dadini di speck e mescolate con un 
                            cucchiaio (serviranno per la guarnizione del piatto finito).Versate il riso fino a terminarla, lasciandola 
                            assorbire ogni volta prima di aggiungerne altra. Quando la birra sarà stata assorbita versate un mestolo di brodo.
                            Quando il riso sarà al dente unite la ricotta mescolate per farla sciogliere, dovrà rendere il riso cremoso. 
                            A cottura ultimata spegnete il fuoco, aromatizzate con il prezzemolo tritato");

--O2: Visionare tutti i dati di una ricetta
SELECT *
FROM ricetta
WHERE id_ricetta = 8


--O3: Ricerca di una ricetta in base agli ingredienti
SELECT R.id_ricetta, R.titolo, R.id_categoria, R.numero_recensioni, R.dosi_per, R.preparazione,
        R.senza_glutine, R.senza_lattosio, R.gourmet, R.media_apprezzamento
FROM ricetta R, contiene C, ingrediente I
WHERE R.id_ricetta = C.id_ricetta AND C.id_ingrediente = I.id_ingrediente AND
      I.nome = "Spaghetti" AND
      C.quantita < "350g"
                        

--O4: assegna un ingrediente ad una ricetta
INSERT INTO contiene (id_ricetta, id_ingrediente, quantita) 
VALUES (35, 29, "2 spicchi");


--O5: inserire un nuovo ingrediente
INSERT INTO ingrediente (id_ingrediente, nome, con_glutine, con_lattosio)
VALUES (141, "Ananas", 0, 0);


--O6: stampare tutti gli ingredienti che fanno parte di una ricetta
SELECT DISTINCT i.id_ingrediente, i.nome, i.con_glutine, i.con_lattosio
FROM contiene c, ricetta r, ingrediente i
WHERE i.id_ingrediente = c.id_ingrediente AND c.id_ricetta = r.id_ricetta AND
        r.titolo = "Spritz"


--O7: Visionare tutti gli ingredienti con lattosio verso cui un utente registrato è intollerante
--mi serve la tabella intolleranza alimentare verso, la tabella ingrediente e la tabella utente registrato
SELECT DISTINCT ia.nickname, i.nome
FROM intolleranza_alimentare_verso ia, ingrediente i, utenteregistrato u
WHERE ia.id_ingrediente = i.id_ingrediente AND i.con_lattosio = 1


--ricetta, categoriaricetta, utente registrato
--O8: stampare il nickname degli utenti registrati che non hanno mai pubblicato ricette di categoria "Primi piatti" 
SELECT ur.nickname
FROM utenteregistrato ur
WHERE ur.nickname NOT IN (SELECT DISTINCT r.nickname
			  FROM utenteregistrato u, ricetta r, categoriaricetta c
			  WHERE u.nickname = r.nickname AND 
                                r.id_categoria = c.id_categoria AND				
                                c.nome = "Primi piatti")


--O9: inserire una nuova recensione
INSERT INTO recensione (id_ricetta, nickname, data, voto_apprezzamento, descrizione) 
VALUES (20, "Miri95", "2022/09/15", 4, "Tutti a tavola sono rimasti contenti!");


--O10: stampare il numero di recensioni totali di una ricetta
SELECT id_ricetta, titolo, numero_recensioni
FROM ricetta
WHERE id_ricetta = 3


--O11: visionare il numero di recensioni fatte da un utente registrato
SELECT COUNT(*)
FROM recensione r, utenteregistrato u
WHERE r.nickname = u.nickname AND r.nickname = "ScalziLuisa1_"


--O12: inserire un utenteregistrato
INSERT INTO utenteregistrato (nickname, data_nascita, data_registrazione, newsletter, id_utente)
VALUES ("fabio_castagnetti00", "2000/06/08", "03/12/2020", 1, 241) CHECK (id_utente IN (SELECT id_utente
                                                                                        FROM utente))


--O13: Stampare l’elenco di tutte le ricette pubblicate di un utente registrato con votazione maggiore di tre
SELECT r.id_ricetta, r.titolo , r.nickname, r.media_apprezzamento
FROM ricetta r, utenteregistrato u
WHERE r.nickname = u.nickname AND r.nickname = "name_is_anna" 
        AND r.media_apprezzamento > 3


--O14: inserire un nuovo utente
INSERT INTO utente (id_utente, nome, cognome) 
VALUES (401, "Luigi", "Rossi")


--O15: cancellazione di un ingrediente
DELETE FROM ingrediente
WHERE nome = "Nutella"


--O16: visionare tutte le ricette senza glutine
SELECT *
FROM ricetta
WHERE senza_glutine = 'T'


--O16 bis: visionare tutte le ricette senza lattosio
SELECT *
FROM ricetta
WHERE senza_lattosio = 'T'


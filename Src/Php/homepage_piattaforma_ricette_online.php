<?php 
    session_set_cookie_params(86400);
    session_start();
    session_regenerate_id(true);
?>

<!DOCTYPE html>
<html>
    <head>
        <title>
            Homepage Piattoforma di gestione ricette online
        </title>
        <style> p {font-family: arial; color: peru; font-size: 30px;} 
                table, th, td {border: 1px solid black;}
        </style>
    </head>
    <body>
        <p><strong> Ricetta del giorno </strong></p>

        <?php

            include('connessione.php');

            define("DBNAME", "db_ricette");
            $date = date("Y/m/d");
            echo "<p style=\"color:black; font-size: 13px;\">";
            printf("(Today is ");
            printf(date("l"));
            printf(" $date)");
            echo "</p>";

            $conn->select_db(DBNAME);
            
            $sql = "SELECT COUNT(*) AS numero_ricette FROM db_ricette.ricetta";
            $res = $conn->query($sql);
                
            if(empty($res)){
                    echo "Error: " . $sql . "<br>" . $conn->error;
            }

            if($res->num_rows > 0){
                $row = $res->fetch_assoc();
                $num_ricette = (int)$row['numero_ricette'];
            }
            else{
                "Nessuna ricetta restituita<br>";
            }

            if(!isset($_SESSION['id'])){
                $_SESSION['id'] = rand(1, $num_ricette);
            }

            $stmt = $conn->prepare("SELECT titolo, gourmet, senza_glutine, senza_lattosio, nickname, dosi_per, preparazione FROM db_ricette.ricetta
                                        WHERE id_ricetta = ?");
            $stmt->bind_param("i", $_SESSION['id']);

            if($stmt->execute() === TRUE){
                $res = $stmt->get_result();

                if($res->num_rows > 0){
                    $record = $res->fetch_assoc();

                    echo '<table>';
                        echo '<tr>';
                            echo '<th> Titolo </th>';
                            echo '<th> senza_glutine </th>';
                            echo '<th> senza_lattosio </th>';
                            echo '<th> dosi_per </th>';
                            echo '<th> gourmet </th>';
                            echo '<th> nickname </th>';
                            echo '<th> preparazione </th>';
                        echo '</tr>';
                        echo '<tr>';
                        echo '<td>' . htmlspecialchars($record['titolo']) . '</td>';
                            echo '<td>' . htmlspecialchars($record['senza_glutine']) . '</td>';
                            echo '<td>' . htmlspecialchars($record['senza_lattosio']) . '</td>';
                            echo '<td>' . htmlspecialchars($record['dosi_per']) . '</td>';
                            echo '<td>' . htmlspecialchars($record['gourmet']) . '</td>';
                            echo '<td>' . htmlspecialchars($record['nickname']) . '</td>';
                            echo '<td>' . htmlspecialchars($record['preparazione']) . '</td>';
                        echo '</tr>';
                    echo '</table>';
                }
                else{
                    echo "Nessun risultato<br>";
                }
            }
            else{
                echo "Error: " . $stmt . "<br>" . $stmt->error;
            }

            $res->free();
            $stmt->close();
            $conn->close();
                
        ?>

        <br><q>La lettera F nelle voci <b>senza_lattosio</b> e <b>senza_glutine</b> vuole dire NO</q><br>
        <q>La lettera T nelle voci <b>senza_lattosio</b> e <b>senza_glutine</b> vuole dire SI</q><br><br>
        <a href="CRUD_ricetteweb.php"> Esplora tutte le ricette pubblicate e molto altro ancora </a>
    </body>
</html>

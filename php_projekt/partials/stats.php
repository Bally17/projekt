<?php
    include 'database/database_conn.php';
// Získaj všetky dáta z tabuľky hraci

if (isset($_POST['delete'])) {
    $id = $_POST['delete'];
    $sql = "DELETE FROM hraci WHERE id=$id";           //prikaz na vymazanie rezervacie

    if ($conn->query($sql) === TRUE) {
        echo "";
    } else {
        echo "Chyba pri odstraňovaní hráča: " . $conn->error;
    }
}

$sql = "SELECT hraci.id, hraci.meno, hraci.priezvisko, hraci.rocnik, pozicia.nazov AS pozicia, hraci.odohrane_zapasy, hraci.pocet_golov, hraci.pocet_asistencii FROM `hraci` INNER JOIN pozicia ON hraci.pozicia = pozicia.id";

$result = mysqli_query($conn, $sql);



// Over, či sa podarilo získať dáta
if (mysqli_num_rows($result) > 0) {
    // Vytvor tabuľku a vypíš dáta z databázy
    echo '<div id="statistiky" class="stats">';
    echo '<table>';
    echo '<thead>';
    echo '<tr>';
    echo '<th>Meno</th>';
    echo '<th>Priezvisko</th>';
    echo '<th>Ročník</th>';
    echo '<th>Pozícia</th>';
    echo '<th>Od.zápasy</th>';
    echo '<th>Góly</th>';
    echo '<th>Asistencie</th>';
    if (isset($_SESSION['admin']) && $_SESSION['admin'] == 1) {
        echo '<th class="stat_admin">Akcia</th>';
    }
    echo '</tr>';
    echo '</thead>';
    echo '<tbody>';
    while ($row = mysqli_fetch_assoc($result)) {
        echo '<tr>';
        echo '<td>' . $row["meno"] . '</td>';
        echo '<td>' . $row["priezvisko"] . '</td>';
        echo '<td>' . $row["rocnik"] . '</td>';
        echo '<td>' . $row["pozicia"] . '</td>';
        echo '<td>' . $row["odohrane_zapasy"]   . '</td>';
        echo '<td>' . $row["pocet_golov"] . '</td>';
        echo '<td>' . $row["pocet_asistencii"] . '</td>';
        if (isset($_SESSION['admin']) && $_SESSION['admin'] == 1) {
            echo "<td class='stat_admin'>
                <form method='post' action=''>
                    <input type='hidden' name='delete' value='" . $row["id"] . " '>
                    <input type='submit' value='Odstrániť, " . $row["meno"] . "' 
                    style='
                        background-color: #0e1720;
                        border: 1px solid white;
                        color: white;
                        border-radius: 50px;
                        padding: 5px 10px;
                        cursor: pointer
                    '>
                </form>
            </td>";
        }        
        echo '</tr>';
    }
    echo '</tbody>';
    echo '</table>';
    echo '</div>';
} else {
    echo "Žiadne dáta v tabuľke.";
}

// Ukonči pripojenie k databáze
mysqli_close($conn);
?>
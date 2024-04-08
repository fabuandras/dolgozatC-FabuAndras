<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fabu András</title>
</head>
<body>
    <h2>PHP - adatbázis</h2>
    <table>
        <tr>
            <th>Név</th>
            <th>Klub neve</th>
            <th>Maximális méret</th>
        </tr>
        <?php
            // Nevek tömbje
            $felhasznalok = ["Nagy Tibor", "Szabó Klára", "Kovács Tóbiás", "Hofi Géza"];

            // Klub nevek tömbje
            $klubok = ["Golf", "Póker", "Társas", "Gémer"];

            // Maximális máretek tömbje
            $maxMeretek = [20, 99, 27, 73];
        
            // Véletlen számok [10, 100] intervallumban
            function veletlenSzam() {
                return rand(10, 100);
            }

            // Nevek táblázatban
            for ($i = 0; $i < count($felhasznalok); $i++) {
                echo "<tr>";
                echo "<td>" . $felhasznalok[$i] . "</td>";
                echo "<td>" . $maxMeretek[$i] . "</td>";
                echo "</tr>";
            }

            // Klub nevek táblázatban

        ?>
    </table>
</body>
</html>
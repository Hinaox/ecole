<%-- 
    Document   : ListeEtudiant
    Created on : 10 mars 2022, 08:47:09
    Author     : cleme
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste etudiant</title>
    </head>
    <body>
    <center>
        <h1>Liste etudiant</h1>
        <table border="1" width="500">
            <tr>
                <th>Identifiant</th>
                <th>Nom</th>*
                <th>Prenom</th>
                <th>Age</th>
                <th>Classe(année scolaire)</th>
                <th>Ecolage</th>
                <th>Moyenne</th>
                <th></th>
            </tr>
            <tr>
                <td>E125</td>
                <td>Rakoto</td>
                <td>Jean</td>
                <td>18</td>
                <td>S5(2021-2022)</td>
                <td>OK</td>
                <td>12.75</td>
                <td><button>Voir sa fiche</button></td>
            </tr>
             <tr>
                <td>E126</td>
                <td>Randria</td>
                <td>Jeanne</td>
                <td>18</td>
                <td>S5(2021-2022)</td>
                <td>KO</td>
                <td>10</td>
                <td><button>Voir sa fiche</button></td>
            </tr>
        </table>
    </center>
    </body>
</html>

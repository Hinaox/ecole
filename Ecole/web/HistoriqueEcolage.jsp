<%@ include file="Template.jsp" %>
<div id="content">
<center>
        <h1>Historique paiement ecolage</h1>
        <p>Classe(année scolaire): S5(2021-2022)</p>
        <p>date limite de paiement: 01/05/2022</p>
        <table border="1" width="700">
            <tr>
                <th>Date\Classe</th>
                <th>Identifiant</th>
                <th>Nom</th>
                <th>Prenom</th>
                <th>Montant</th>
                <th>Payé</th>
                <th>Reste</th> 
            </tr>
            <tr>
                <td>12/12/2021\S5</td>
                <td>E127</td>
                <td>Jean</td>
                <td>Robert</td>
                <td>1200000Ar</td>
                <td>500000Ar</td>
                <td>700000Ar</td>
            </tr>
            <tr>
                <td>12/01/2022\S5</td>
                <td>E127</td>
                <td>Jean</td>
                <td>Robert</td>
                <td>700000Ar</td>
                <td>500000Ar</td>
                <td>200000Ar</td>
            </tr>
            <tr>
                <td>TOTAL</td>
                <td>E127</td>
                <td>Jean</td>
                <td>Robert</td>
                <td>1200000Ar</td>
                <td>1000000Ar</td>
                <td>200000Ar</td>
            </tr>
            <tr>
                <td>Payer</td>
                <td></td>
                <td></td>
                <td></td>
                <td>200000Ar</td>
                <td><input type="text" name="montant">Ar</td>
                <td><button>Payer</button></td>
            </tr>
        </table>
        </br>
        </br>
        </br>
        <p>Classe(année scolaire): S3(2020-2021)</p>
        <table border="1" width="700">
            <tr>
                <th>Date\Classe</th>
                <th>Identifiant</th>
                <th>Nom</th>
                <th>Prenom</th>
                <th>Montant</th>
                <th>Payé</th>
                <th>Reste</th> 
            </tr>
            <tr>
                <td>12/12/2020\S3</td>
                <td>E127</td>
                <td>Jean</td>
                <td>Robert</td>
                <td>1200000Ar</td>
                <td>500000Ar</td>
                <td>700000Ar</td>
            </tr>
            <tr>
                <td>12/01/2021\S3</td>
                <td>E127</td>
                <td>Jean</td>
                <td>Robert</td>
                <td>700000Ar</td>
                <td>500000Ar</td>
                <td>200000Ar</td>
            </tr>
            <tr>
                <td>12/02/2021\S3</td>
                <td>E127</td>
                <td>JEan</td>
                <td>Robert</td>
                <td>200000Ar</td>
                <td>200000Ar</td>
                <td>0Ar</td>
            </tr>
            <tr>
                <td>TOTAL</td>
                <td>E127</td>
                <td>Jean</td>
                <td>Robert</td>
                <td>1200000Ar</td>
                <td>1200000Ar</td>
                <td>0</td>
            </tr>
            
        </table>
    </center> 
</div>

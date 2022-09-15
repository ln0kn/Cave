<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <style media="screen">
    #logo {

      margin-top: 180px;
      margin-left: 50px;
      /* margin-bottom: 50px; */
      /* float: left; */
    }

    td img {
      width: 70px;
    }
    /* */ table{
      width: 100%;

      /* border: 1px solid; */
      margin-bottom: 30px;
      border-collapse: collapse;
 border-spacing: 0;
    }

    .somme {
      /* line-height: 30%; */
      margin-left: 60%;
      margin-top : -30px;

    }

    #tab1 td {
      line-height: 30%;
    }

    #tab2 td{
      /* border: 1px solid; */
      text-align: left;
      padding: 10px;
      vertical-align: top;
      font-size: 1.2em;
    }

    #tab2 tr:nth-child(2n-1) td {
      background: #F5F5F5;
    }




    table th {
      padding: 5px 20px;
      color: #5D6975;
      /* border-bottom: 1px solid #C1CED9; */
      white-space: nowrap;
      font-weight: normal;
    }

    </style>
  </head>
  <body>
    <table id="tab1">
      <head>
        <td style="width:20%;"><img  src="logo.png"></td>
        <td style="text-align: center;border: 1px solid;"> <h1>Wendsom DISTRIBUTION</h1>
          <br><h3>STE DE DISTTRIBUTION DE BOISSONS BIO</h3>
        </td>
      </head>
    </table>
    <div>
      <h4>Contact : 76 21 21 69 / 70 59 79 79</h4>
      <h4>Doit : {{$tab['nomClients']}}</h4>
      <h2 style="text-align: center;">Facture : #{{$tab['identifiantDevis']}} </h2>
    </div>

    <table>
      <tr>
        <th> # </th>
        <th style="width:19%; text-align: center;"> Désignation </th>
        <th style="width:19%; text-align: center;"> Conditionnement </th>
        <th style="width:19%; text-align: center;"> Quantité </th>
        <th style="width:19%; text-align: center;"> Prix Unitaire </th>
        <th style="width:19%; text-align: center;"> Prix Total </th>
      </tr>
      <tbody id="tab2">
        @for ($i = 0 ;$i < count($prod) ; $i++)
        <tr>
          <td style="text-align: center;" >{{$i +1 }}</td>
          <td style="text-align: center;" >{{$prod[$i]['prod']}}</td>
          <td style="text-align: center;" >{{$prod[$i]['pack']}}</td>
          <td style="text-align: center;" >{{$prod[$i]['qte']}}</td>
          <td style="text-align: center;" >{{$prod[$i]['prixU']}}</td>
          <td style="text-align: center;" >{{$prod[$i]['prixT']}}</td>
        </tr>
        @endfor
        <tr>
          <td colspan="2"> </td>
          <td style="text-align: left;" colspan ='3'>Montant Total des prodduits </td>
          <td style="text-align: center;" >{{$tab['montantDevis']}}</td>
        </tr>

        <tr>
          <td colspan="2"> </td>
          <td style="text-align: left;" colspan ='3' >Remise</td>
          <td style="text-align: center;" > {{$tab['reduction']}} </td>
        </tr>
        <tr>
          <td colspan="2"> </td>
          <td style="text-align: left;" colspan ='3'>Somme à Payer</td>
          <td style="text-align: center;" > {{$tab['sommeAPayer']}} </td>
        </tr>
      </tbody>
    </table>
    <br>
    <p>Arrêter la résente facture à la somme de : <b> ({{$tab['sommeAPayer']}}) Francs CFA .</b></p>
    <p>Ouagadougou le : {{$tab['date']}}</p>
    <br>
    <p> <b>Le Responsable</b> </p>
  </body>
</html>

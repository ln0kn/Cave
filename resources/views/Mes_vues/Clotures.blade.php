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

      border: 1px solid;
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
      text-align: center;
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
      border-bottom: 1px solid #C1CED9;
      white-space: nowrap;
      font-weight: normal;
    }

    </style>
  </head>
  <body>
    <table id="tab1">
      <head>
        <td style="width:10%;"><img  src="logo.png"></td>
        <td style="text-align: left;border: 1px solid;"> <h2>Wendsome S.A.</h2><h4> distrubution de boissons</h4> </td>
        <td style="width:42%;text-align: left;border: 1px solid;" >
        </td>
      </head>
    </table>

    <h3>Cloture du </h3>

    <table>
      <tr>
        <th> # </th>
        <th style="width:30%; text-align: center;"> Produit </th>
        <th style="width:30%; text-align: center;"> Qté Vendu(bouteille) </th>
        <th style="width:30%; text-align: center;"> Montant Vendu </th>
      </tr>
      <tbody id="tab2">
        @foreach($tab as $i => $val)
        <tr>
          <td> {{$i }} </td>
          <td> {{$tab3[$i]}} </td>
          <td> {{$tab2[$i]}} </td>
          <td> {{$val}} </td>
        </tr>
        @endforeach
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td>Total</td>
          <td>{{$qte}}</td>
          <td>{{$vte}}</td>
        </tr>
        <tr>

          <td colspan="2" >somme Encaisser</td>
          <td colspan="2" >{{$somme}}</td>

        </tr>
      </tbody>
    </table>
    <div class="somme">
      <table>
        <tbody>


        </tbody>
      </table>
    </div>


  </body>
</html>

<?php
use App\User;
use App\Notifications\TaskStock;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
  //
  // $user =User::find(1);
  // No/tification::route('mail','taylor@laravel.com')->notify(new TaskStock($user));

  // $when = now()->addSeconds(15);
  // $when = Carbon::now()->addMinutes(1);
  // User::find(1)->notify((new TaskStock)-> delay($when));

  // User::find(1) ->notify(new TaskStock);
    return view('auth.login');
});


//
// Route::get('/devis', function () {
//     return view('Mes_vues.Devis');
// });


Auth::routes();

Route::get('/getUser', 'Auth\RegisterController@getUser')->name('getUser');
Route::put('/updateUser', 'Auth\RegisterController@updateUser')->name('updateUser');
Route::delete('/deleteUser', 'Auth\RegisterController@deleteUser')->name('deleteUser');
Route::get('/getUserEmp', 'HomeController@UserEmp')->name('getUserEmp');
Route::post('/resetPassword', 'HomeController@changePassword')->name('resetPassword');

//avoir le stock a tous moment
Route::get('/urlPlus', 'HomeController@plus')->name('urlPlus');
//notification
Route::get('/unreadNotif', 'HomeController@unreadNotif')->name('unreadNotif');
Route::get('/markAsRead', 'HomeController@markAsRead')->name('markAsRead');

//make facture
Route::post('/mkFacture', 'HomeController@mkFacture')->name('mkFacture');

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/Statistiques', 'HomeController@stats')->name('stat');
Route::get('/urlStats', 'HomeController@chart')->name('urlStats');

////********Route vers FamilleProduit
Route::get('/Produits', 'ProduitController@index')->name('Produits');
Route::post('/addFamilleProduits', 'ProduitController@add')->name('addFamilleProduits');
Route::put('/updateFamilleProduits', 'ProduitController@update')->name('updateFamilleProduits');
Route::delete('/deleteFamilleProduits', 'ProduitController@delete')->name('deleteFamilleProduits');
Route::get('/getFamilleProduits', 'ProduitController@get')->name('getFamilleProduits');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////****************routes pour marque produits
Route::post('/addMarqueProduits', 'ProduitController@addMarque')->name('addMarqueProduits');
Route::put('/updateMarqueProduits', 'ProduitController@updateMarque')->name('updateMarqueProduits');
Route::delete('/deleteMarqueProduits', 'ProduitController@deleteMarque')->name('deleteMarqueProduits');
Route::get('/getMarqueProduits', 'ProduitController@getMarque')->name('getMarqueProduits');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////****************routes pour  produits
Route::post('/addProduits', 'ProduitController@addProduits')->name('addProduits');
Route::put('/updateProduits', 'ProduitController@updateProduits')->name('updateProduits');
Route::delete('/deleteProduits', 'ProduitController@deleteProduits')->name('deleteProduits');
Route::get('/getProduits', 'ProduitController@getProduits')->name('getProduits');
Route::get('/getFamilles', 'ProduitController@getFamilles')->name('getFamilles');
Route::get('/getMarques', 'ProduitController@getMarques')->name('getMarques');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////****************routes pour  type clients
Route::get('/Clients', 'ClientController@index')->name('Clients');
Route::get('/getClientTypes', 'ClientController@getClientTypes')->name('getClientTypes');
Route::post('/addClientTypes', 'ClientController@addClientTypes')->name('addClientTypes');
Route::put('/updateClientTypes', 'ClientController@updateClientTypes')->name('updateClientTypes');
Route::delete('/deleteClientTypes', 'ClientController@deleteClientTypes')->name('deleteClientTypes');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////****************routes pour  clients
Route::get('/getTypeClients', 'ClientController@getTypeClients')->name('getTypeClients');
Route::get('/getClients', 'ClientController@getClients')->name('getClients');
Route::post('/addClients', 'ClientController@addClients')->name('addClients');
Route::put('/updateClients', 'ClientController@updateClients')->name('updateClients');
Route::delete('/deleteClients', 'ClientController@deleteClients')->name('deleteClients');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////****************routes pour  Fournissuers
Route::get('/Fournisseurs', 'FournisseurController@index')->name('Fournisseurs');
Route::get('/getFournisseurs', 'FournisseurController@getFournisseurs')->name('getFournisseurs');
Route::post('/addFournisseurs', 'FournisseurController@addFournisseurs')->name('addFournisseurs');
Route::put('/updateFournisseurs', 'FournisseurController@updateFournisseurs')->name('updateFournisseurs');
Route::delete('/deleteFournisseurs', 'FournisseurController@deleteFournisseurs')->name('deleteFournisseurs');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////****************routes pour  prix
Route::get('/Remises', 'RemiseController@index')->name('Remises');
Route::get('/getProduitPrix', 'RemiseController@getProduitPrix')->name('getProduitPrix');
Route::get('/getPrix', 'RemiseController@getPrix')->name('getPrix');
Route::post('/addPrix', 'RemiseController@addPrix')->name('addPrix');
Route::put('/updatePrix', 'RemiseController@updatePrix')->name('updatePrix');
Route::delete('/deletePrix', 'RemiseController@deletePrix')->name('deletePrix');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////****************routes pour  remises
// Route::get('/getProduitPrix', 'RemiseController@getProduitPrix')->name('getProduitPrix');
Route::get('/getRemises', 'RemiseController@getRemises')->name('getRemises');
Route::post('/addRemises', 'RemiseController@addRemises')->name('addRemises');
Route::put('/updateRemises', 'RemiseController@updateRemises')->name('updateRemises');
Route::delete('/deleteRemises', 'RemiseController@deleteRemises')->name('deleteRemises');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////****************routes pour  Approvissionnement
Route::get('/Approvissionnements', 'ApprovissionnementController@index')->name('Approvissionnements');
Route::get('/getFournisseurProduits', 'ApprovissionnementController@getFournisseurProduits')->name('getFournisseurProduits');
Route::get('/getApprovissionnements', 'ApprovissionnementController@getApprovissionnements')->name('getApprovissionnements');
Route::post('/addApprovissionnements', 'ApprovissionnementController@addApprovissionnements')->name('addApprovissionnements');
Route::put('/updateApprovissionnements', 'ApprovissionnementController@updateApprovissionnements')->name('updateApprovissionnements');
Route::delete('/deleteApprovissionnements', 'ApprovissionnementController@deleteApprovissionnements')->name('deleteApprovissionnements');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////****************routes pour  stock
Route::get('/Stocks', 'StockController@index')->name('Stocks');
Route::get('/getStocks', 'StockController@getStocks')->name('getStocks');
// Route::get('/getApprovissionnements', 'StockController@getApprovissionnements')->name('getApprovissionnements');
// Route::post('/addApprovissionnements', 'StockController@addApprovissionnements')->name('addApprovissionnements');
// Route::put('/updateApprovissionnements', 'StockController@updateApprovissionnements')->name('updateApprovissionnements');
// Route::delete('/deleteApprovissionnements', 'StockController@deleteApprovissionnements')->name('deleteApprovissionnements');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////****************routes pour  ajustements
Route::post('/addAjustements', 'StockController@addAjustements')->name('Ajustements');
Route::get('/getAjustements', 'StockController@getAjustements')->name('getAjustements');

//////////////////////*****************routes pour rebuts
Route::get('/getRebuts', 'StockController@getRebuts')->name('getRebuts');
Route::get('/getProduitVentes', 'StockController@getProduitVentes')->name('getProduitVentes');
Route::post('/addRebuts', 'StockController@addRebuts')->name('addRebuts');
// Route::put('/updateApprovissionnements', 'StockController@updateApprovissionnements')->name('updateApprovissionnements');
// Route::delete('/deleteApprovissionnements', 'StockController@deleteApprovissionnements')->name('deleteApprovissionnements');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////****************routes pour  ventes
Route::get('/Ventes', 'VenteController@index')->name('Ventes');
// Route::get('/getVentes', 'VenteController@getVentes')->name('getVentes');
Route::get('/getProduitFamilles', 'VenteController@getProduitFamilles')->name('getProduitFamilles');
Route::get('/getClientVentes', 'VenteController@getClientVentes')->name('getClientVentes');
Route::get('/getRemiseVentes', 'VenteController@getRemiseVentes')->name('getRemiseVentes');
Route::get('/getVentes', 'VenteController@getVentes')->name('getVentes');
Route::post('/addVentes', 'VenteController@addVentes')->name('addVentes');
Route::delete('/cancelVentes', 'VenteController@cancelVentes')->name('cancelVentes');

//////////////////////devis
Route::post('/addDevis', 'VenteController@addDevis')->name('addDevis');
Route::put('/updateVentes', 'VenteController@updateVentes')->name('updateVentes');

///////////////////clotures journee
Route::get('/getClotures', 'VenteController@getClotures')->name('getClotures');
Route::post('/addClotures', 'VenteController@addClotures')->name('addClotures');
Route::post('/bilan', 'HomeController@bilanCloture')->name('bilan');
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



///////////////****************routes pour  Autres
Route::get('/Autres', 'AutreController@index')->name('Autres');
/////////////////////////*******versements routes
Route::post('/addVersements', 'AutreController@addVersements')->name('addVersements');
Route::put('/updateVersements', 'AutreController@updateVersements')->name('updateVersements');
Route::get('/getVersements', 'AutreController@getVersements')->name('getVersements');
Route::get('/getCredits', 'AutreController@getCredits')->name('getCredits');
///////////////////////////////---------Routes dons
Route::post('/addDons', 'AutreController@addDons')->name('addDons');
Route::put('/updateDons', 'AutreController@updateDons')->name('updateDons');
Route::get('/getDons', 'AutreController@getDons')->name('getDons');

///////////////****************routes pour  Enrollement
Route::get('/Enrollements', 'EnrollementController@index')->name('Enrollements');
// /////////////////////////*******postes routes
Route::post('/addPostes', 'EnrollementController@addPostes')->name('addPostes');
Route::put('/updatePostes', 'EnrollementController@updatePostes')->name('updatePostes');
Route::get('/getPostes', 'EnrollementController@getPostes')->name('getPostes');
Route::get('/getPosteEnrolles', 'EnrollementController@getPosteEnrolles')->name('getPosteEnrolles');
Route::delete('/deletePostes', 'EnrollementController@deletePostes')->name('deletePostes');
// ///////////////////////////////---------Routes Enrolles
Route::post('/addEnrolles', 'EnrollementController@addEnrolles')->name('addEnrolles');
Route::put('/updateEnrolles', 'EnrollementController@updateEnrolles')->name('updateEnrolles');
Route::get('/getEnrolles', 'EnrollementController@getEnrolles')->name('getEnrolles');
Route::delete('/deleteEnrolles', 'EnrollementController@deleteEnrolles')->name('deleteEnrolles');

///////// Route::get('/getRemiseVentes', 'VenteController@getRemiseVentes')->name('getRemiseVentes');
// Route::get('/getVentes', 'VenteController@getVentes')->name('getVentes');
// Route::post('/addVentes', 'VenteController@addVentes')->name('addVentes');

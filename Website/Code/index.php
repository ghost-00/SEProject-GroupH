<?php

// On charge le framework Silex
require_once 'vendor/autoload.php';

use Symfony\Component\HttpFoundation\Request;

// On définit des noms utiles
use Silex\Application;

// On crée l'application et on la configure en mode debug
$app = new Application();
$app['debug'] = true;

 /*
 *inclusion de module
 */
////------------------------session---------------------------------------
$app->register(new Silex\Provider\SessionServiceProvider());
if(isset($_GET['lang']))
{
    $app['session']->set('lang',$_GET['lang']);
    
}

if(! $app['session']->get('lang'))
{
   $app['session']->set('lang','fr');
}

////----------------twig-----------------------------------------------------
$app->register(new Silex\Provider\TwigServiceProvider(), 
	       array('twig.path' => '.',));
$app->register(new Silex\Provider\TranslationServiceProvider(), array(
    'locale_fallbacks' => array( $app['session']->get('lang')),
));
////----------------translation-----------------------------------------------------
use Symfony\Component\Translation\Loader\YamlFileLoader;

$app['translator'] = $app->share($app->extend('translator', function($translator, $app) {
    $translator->addLoader('yaml', new YamlFileLoader());

    $translator->addResource('yaml', __DIR__.'/locales/en.yml', 'en');
    $translator->addResource('yaml', __DIR__.'/locales/nl.yml', 'nl');
    $translator->addResource('yaml', __DIR__.'/locales/fr.yml', 'fr');

    return $translator;
}));
////----------------------------bdd------------------
////----------------------------variable global------------------
$page=array();
$page['titre']='';
$page['description']='';
$page['key']='';

/////-----------Connexion base de donnée -------------------
class connexion {
    public $db;
	//constructeur
    function __construct() {
     
    }
    //connexion à la base de donnée
    function active(){
         try {
$dns = 'mysql:host=localhost:8889;dbname=Tennis_tournament';
$utilisateur = 'root';
$motDePasse = 'root';// tu remplace juste le mot de passe par vide
$db = new PDO( $dns, $utilisateur, $motDePasse );
}
catch ( Exception $e ) {
  die ($e->getMessage());
  
}
  return $db;
    }
}

$db1=new connexion;
$db=$db1->active();



/*
 *fin inclusion module
 */
 
 
 
 /*--------------------------------------------------------------------------------------------------------------------------------------*/
 //                                                                                                                                      //
 //                                               DEBUT DES ROUTES                                                                       //
 //                                                                                                                                      //
 /*--------------------------------------------------------------------------------------------------------------------------------------*/
// On définit une route pour l'url /
$app->get('/', function(Application $app) {
	/*global $db;
	$req = $db->query("select * from users");
	$req = $req->fetchAll();
	print_r($req); */
   	$titre='Charles Lorraine';
   	$description='quia Montius inter dilancinantium manus';
	$keywords='Charles, Lorraine, tournois de tennis';
    return $app['twig']->render('web/index.html', array('title' => $titre,
															'description' => $description,
															'keywords' => $keywords,
															'lang' => $app["session"]->get('lang')));
  });

/**************************************

    LOGIN

***************************************/

$app->post('login', function(Application $app, Request $req) {
	global $db;
	
	$username = $db->quote($req->request->get("usermail"));
	$password = $db->quote($req->request->get("password"));
	
	
	$req = $db->query("select * from Users where Usermail = $usermail and Userpassword = $password");
	$req = $req->fetchAll();
	//var_dump($req);
	
	if(empty($req)){
		return "Login ou password incorrect";
	}else{
		return "vous etes connecté";
	}
});

/*****************************

LOGUP

******************************/

$app->post('confirm-new', function(Application $app, Request $req) {
	global $db;
	
	//get last name
	$userlastname = $db->quote($req->request->get("userlastname"));
	//get first name
	$userfirstname = $db->quote($req->request->get("userfirstname"));
	//get email 
	$usermail = $db->quote($req->request->get("usermail"));
	//get wordpass
	$userpassword = $db->quote($req->request->get("userpassword"));
	$confirmpassword = $db->quote($req->request->get("confirmpassword"));
	//get adress : street, number, boxe, zip, locality
	$useradress = $db->quote($req->request->get("useradress"));
	$useradressN = $db->quote($req->request->get("useradressN"));
	$useradressB = $db->quote($req->request->get("useradressB"));
	$useradressZ = $db->quote($req->request->get("useradressZ"));
	$useradressL = $db->quote($req->request->get("useradressL"));
	//get phone
	$usercellPhone = $db->quote($req->request->get("usercellPhone"));
	$userphone = $db->quote($req->request->get("userphone"));
	//get birthday
	$userbirthday = $db->quote($req->request->get("userbirthday"));
	//date of creation 
	$date = date('Y-m-d', strtotime(date('Y-m-d')));
	
	echo $userlastname."<br/>";
	echo $userfirstname."<br/>";
	echo $usermail."<br/>";
	//echo password
	echo $userpassword."<br/>";
	echo $confirmpassword."<br/>";
	//echo adress
	echo $useradress."<br/>";
	echo $useradressN."<br/>";
	echo $useradressB."<br/>";
	echo $useradressZ."<br/>";
	echo $useradressL."<br/>";
	//echo phones
	echo $usercellPhone."<br/>";
	echo $userphone."<br/>";
	
	echo $userbirthday."<br/>";
	
	$req = $db->query("INSERT INTO  `tennis_tournament`.`users` (
`UserId` ,
`UserFirstName` ,
`UserLastName` ,
`UsersBirthDate` ,
`UserAddress` ,
`UserAddressN` ,
`UserAddressB` ,
`UserAddressC` ,
`UserAddressL` ,
`UserPhone` ,
`UserMail` ,
`Username` ,
`Userpassword` ,
`UserCreationDate`
)
VALUES (
NULL , $userfirstname , $userlastname , $userbirthday , $useradress , $useradressN , $useradressB , $useradressZ , $useradressL , $userphone ,  $usermail, $usermail,  $userpassword, $date
)") or die($db->errorInfo()[2]);

	$req = $req->fetchAll();
	//var_dump($req);
	
	if(empty($req)){
		return "Vous etes enregistré";
	}else{
		return "Error";
	}
});


// On lance l'application
$app->run();



?>

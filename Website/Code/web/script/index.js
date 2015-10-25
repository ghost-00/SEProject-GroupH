// JavaScript Document
$(document).ready(function(){
  
  $('#form-bg').fadeIn(1000);
  $('#sign-in-form').fadeIn(2000);

  /******************************
	
  LOGIN
  *******************************/
  $('#login').click(function(){
	$.post("index.php/login", {usermail: $("#email").val(), password: $("#password").val()}, function(data){
		data = $.parseJSON(data);
		
		if (data.connected == true) {
			//redirection 
			$("#message").html("Vous avez bien été connecté.");
			window.location = 'index.php/staff'; 
		}
		else {
			$("#message").html("Email ou mot de passe erroné.");
		}
		
		
	});
	
  });
  
  /******************************
  LOGUP
  *******************************/
  $('#confirm-new').click(function(){
	  //alert($("#UserFirstName").val() + "et" + $("#UserLastName").val());
	$.post("index.php/confirm-new", {userfirstname: $("#UserFirstName").val(), 
									 userlastname: $("#UserLastName").val(), 
									 usermail: $("#UserMail").val(), 
									 userpassword: $("#UserPassword").val(),
									 confirmpassword: $("#UserPassword2").val(),
									 //Adresse : street, number, zip-code
									 useradress: $("#UserAddress").val(),
									 useradressN: $("#UserAddressN").val(),
									 useradressB: $("#UserAddressB").val(),
									 useradressZ: $("#ZipCode").val(),
									 useradressL: $("#UserAddressL").val(),
									 //Phone : GSM and fixe
									 usercellPhone: $("#UserMobile").val(),
									 userphone: $("#UserPhone").val(),
									 userbirthday: $("#birthday").val() 
									 }, function(data){
		
		data = $.parseJSON(data);
		
		if (data.encoded == true) {
			//redirection 
			$("#message").html("Vous avez bien été enregistré.");
			$('#sign-up-form').hide();
			$('#form-bg-sign-up').hide();
			$('#form-bg').show();
			$('#sign-in-form').show();
		}
		else {
			$("#message2").html("Vous n'étes pas enregistré");
		}
		
	});
  });
  

	
  $('#new-account').click(function(){
	$('#sign-in-form').hide();
	$('#form-bg').hide();
	$('#form-bg-sign-up').show();
	$('#sign-up-form').show();
  });
  
  $('#error').click(function(){
	$('#sign-in-form').hide();
	$('#form-bg-password').show();
	$('#password-form').show();
  });
  
  $('#cancel').click(function(){
	$('#password-form').hide();
	$('#sign-in-form').show();
  });
  
  $('#cancel-new').click(function(){
	$('#sign-up-form').hide();
	$('#form-bg-sign-up').hide();
	$('#form-bg').show();
	$('#sign-in-form').show();
  });
	
  $('#my-account').click(function(){
	$('#sign-up-form').hide();
	$('#form-bg-sign-up').hide();
	$('#form-bg').show();
	$('#sign-in-form').show();
  });
  
  $('#valide').click(function(){
	/*To do*/
  });
  
  $('#confirm').click(function(){
	/*To do*/
  });
  	
});
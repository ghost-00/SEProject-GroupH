// JavaScript Document
$(document).ready(function(){


  $('#login').click(function(){
	$.post("index.php/login", {usernam: $("#email").val(), password: $("#password").val()}, function(data){
		
		$("#message").html(data)
		
	});
  });
	
  $('#new-account').click(function(){
	$('#form-sign-in').hide();
	$('#form-sign-up').show();
  });
  
  $('#error').click(function(){
	$('#form-sign-in').hide();
	$('#form-password').show();
  });
  
  $('#cancel').click(function(){
	$('#form-password').hiden();
	$('#form-sign-in').show();
  });
	
  $('#my-account').click(function(){
	$('#form-sign-up').hide();
	$('#form-sign-in').show();
  });
  
  $('#valide').click(function(){
	/*To do*/
  });
  
  $('#confirm').click(function(){
	/*To do*/
  });
  	
});
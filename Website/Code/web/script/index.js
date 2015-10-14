// JavaScript Document
$(document).ready(function(){
  
  $('#form-bg').fadeIn(1000);
  $('#sign-in-form').fadeIn(2000);

  $('#login').click(function(){
	$.post("index.php/login", {username: $("#email").val(), password: $("#password").val()}, function(data){
		
		$("#message").html(data)
		
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
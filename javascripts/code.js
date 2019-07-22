
$(function() {
	var addChange = function(ob){
		ob.change = function(callback){
			if(callback){
				if(!this._change) this._change = [];
				this._change.push(callback);
			}
			else{
				if(!this._change) return;
				for(var i=0; i<this._change.length;i++)
					this._change[i].apply(this);
			}
		};
	};


	$("#ver_name_error").hide();

	var error_ver_name = false;

	$(".input").focusout(function(){
		
	});
	//Fehlerabfangen bei Uhrzeit
	/*$(".uhrzeiten").focusout(function(){
		if (.uhrzeiten < 0 || input >24) {
			alert('falsche Zahleneingabe');
		}
	});*/
	//Teest
	$("#Department_feld").focusout(function(){
		if(!input ) {
			alert('invalide angabe');
		}
	});

	//Initialisieren der FormData
	var formData = new FormData();
	//Datenverarbeitung des Formulars
	$("form").submit(function(event){
		event.preventDefault();
		var startDatum = new Date()
		//console.log("I'm heeeere");
		formData.append("name",$("#vername").val());
		formData.append('image',$('input[type=file]')[0].files[0]);
		formData.append('contact',$("#ansprechperson").val());
		formData.append('room',$("#raum").val());
		formData.append("type",$("#art").val());
		formData.append("department",$("#department").val());
		formData.append('description',$("#description").val());
		formData.append('website',$("#website").val());
		//formData.append('')

		for(var pair of formData.entries()) {
			console.log(pair[0]+ ', '+ pair[1]); 
		 }
		//console.log(formData.get(image));
	});
	
	//var email = document.getElementById("start");
	/*
	email.addEventListener("input", function (event) {
	  /*if (email.input < 0) {
		email.setCustomValidity("Nur positive Zahlen!");
	  } else if(email.validity.typeMismatch){
		email.setCustomValidity("Geben Sie eine Zahl zwischen 0 und 23 ein");
	  }
	});*/



});
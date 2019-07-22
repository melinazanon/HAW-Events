
//var views = document.getElementById("view");
$(function(){


    $("input").focusout(function(){
        if(!input){
        alert("beeedooo");
        }
    });
    
   

    var object = {name: "foo", password: "geheim"};

    $("form").submit(function(event){
        event.preventDefault();
            
            object.name =$("#name").val();
            object.password=$("#password").val();

            console.log(object);
            
        jQuery.post("../users/login",object,function(data,status){
            alert("Data"+ data + "\nStatus: " + status);

            
        });
		
	});


});


function regisztracio(){
	var reg_felhasznalonev = document.getElementById("reg_felhasznalonev").value;
	var reg_emailcim = document.getElementById("reg_emailcim").value;
	var reg_jelszo1 = document.getElementById("reg_jelszo1").value;
	var reg_jelszo2 = document.getElementById("reg_jelszo2").value;
	
	var request = new XMLHttpRequest();
	request.open("POST", "mysqli/regisztracio.php", 0);
	request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	request.send("username=" + reg_felhasznalonev + "&email=" + reg_emailcim + "&password1=" + reg_jelszo1 + "&password2=" + reg_jelszo2);
	
	if(request.responseText == 0){
		alert("Sikeres regisztráció!");
	}
	if(request.responseText == 1){
		alert("Felhasználónév foglalt.");
	}
	if(request.responseText == 2){
		alert("Email cim foglalt.");
	}
	if(request.responseText == 3){
		alert("Felhasználónév es email cim foglalt.");
	}
	if(request.responseText == 11){
		alert("A felhasznalonev 5 es 15 karakter kozott kell legyen.");
	}
	if(request.responseText == 12){
		alert("A felhasznalonev 5 es 15 karakter kozott kell legyen." + "\n" + "Az email cim foglalt.")
	}
	if(request.responseText == 13){
		alert("Az email helytelen.");
	}
	if(request.responseText == 14){
		alert("A felhasznalonev foglalt." + "\n" + "Az email cim hejtelen.");
	}
	if(request.responseText == 15){
		alert ("Jelszo megadasa koetelezo.");
	}
	if(request.responseText == 16){
		alert("A felhasznalonev 5 es 15 karakter kozott kell legyen." + "\n" + "Az email cim foglalt." + "\n" + "Jelszo megadasa kozelezo.");
	}
	if(request.responseText == 17){
		alert("A felhasznalonev 5 es 15 karakter kozott kell legyen." + "\n" + "Jelszo megadasa kotelezo.");
	}
	if(request.responseText == 18){
		alert("A felhasznalonev 5 es 15 karakter kozott kell legyen." + "\n" + "Email cim foglalt." + "\n" + "Jelszo es jelszomegerosito megadasa kotelezo");
	}
	if(request.responseText == 19){
		alert("Felhasználónév megadasa koetelezo." + "\n" + "Email cim megadasa koetelezo" + "\n" + "Jelszo megadasa kotelezo");
	}
	if(request.responseText == 20){
		alert("Felhasználónév megadasa kotelezo." + "\n" + "Jelszo megadasa koetelezo.");
	}
	if(request.responseText == 21){
		alert("Jelszo megerositese kotelezo.");
	}
	if(request.responseText == 22){
		alert("A ket jelszo nem egyezik.");
	}
	if(request.responseText == 23){
		alert("A jelszo 4 es 15 karakter kozott kell legyen.");
	}
	if(request.responseText == 24){
		alert("Email cim es jelszo megadasa kotelezo.");
	}
	
	if(errors.length>0){
		reportErrors(errors);
		return false;
	}
}
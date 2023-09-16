function logar(){
    var login = document.getElementById('login').value;
    var senha = document.getElementById('senha').value;

    if(login == "admin" && senha == "1234"){
        alert("Sucesso!!")
    }else{
        alert("Usuario ou senha incorretos")
    }

}

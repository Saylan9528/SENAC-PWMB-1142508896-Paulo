function logar(usuario, senha){
    var id = document.getElementById('login').value;
    var pss = document.getElementById('senha').value;

    if(id == usuario && pss == senha){
        alert("Sucesso!!")
    }else{
        alert("Usuario ou senha incorretos")
    }

}


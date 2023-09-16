function logar(usuario, senha){
    var id = document.getElementById('login').value;
    var pss = document.getElementById('senha').value;

    if(id == usuario && pss == senha){
        alert("Sucesso!!")
    }else{
        alert("Usuario ou senha incorretos")
    }

}
function cadastro() {
    var nome = document.getElementById('nome').value;
    var usuario = document.getElementById('usuario').value;
    var senha = document.getElementById('cad_senha').value;
    var email = document.getElementById('email').value;
    var empresa = document.getElementById('empresa').value;
}

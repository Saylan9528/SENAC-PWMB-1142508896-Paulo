<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Postagem</title>
    <link rel="stylesheet" href="../assets/CSS/estilo.css">
</head>
<body>
    <header>
        <nav id ="area-cabecalho">
            <section id="area-logo"><h1>TecBlog <span class="branco">admin</span></h1></section>
            <section id="area-menu">
                <a href="admin.jsp">Admin</a>
                <a href="postagem.html">Postar</a>
                <a href="artigos.jsp">Consultar</a>
                <a href="alterar.jsp">Editar</a>
                <a href="excluir.jsp">Deletar</a>
                <a href="../index.html">Sair</a>
            </section>
        </nav>
    </header>
    <main>
        <section id="area-principal">
<%
    class Postagem {
        int ID;
        String titulo;
        String conteudo;
        Date dataPublicacao;
    }

    class Login {
        int ID;
        String username;
        String password;
    }
    //dados da postagem.html
    Postagem postagem = new Postagem();
    postagem.ID = 1;
    postagem.titulo = request.getParameter("titulo");
    postagem.conteudo = request.getParameter("conteudo");
    
    String dataString = request.getParameter("data");
    postagem.dataPublicacao = Date.valueOf(dataString);


    //dados do login.html
    Login login = new Login();
    login.ID = 1;
    login.username= request.getParameter("login");
    login.password= request.getParameter("senha");
    
    try{
    //conexão
    Connection conecta;
    PreparedStatement st;
    Class.forName("com.mysql.cj.jdbc.Driver");
    conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tecblog", "root", "");

    

    //inserção de dados
    st = conecta.prepareStatement("insert into postagem (titulo, conteudo, dataPublicacao) values (?, ?, ?)");
    st.setString(1, postagem.titulo);
    st.setString(2, postagem.conteudo);
    st.setDate(3, postagem.dataPublicacao);
    st.executeUpdate();
     
    %>
        <section id="area-postagens">
                    <section class="postagem">
                        <h2>Postagem Efetuada</h2>
                        <img class="img-ex" src="../assets/images/home/sucesso.png" alt="PC">
                        <a href="postagem.html">Voltar</a> |
                        <a href="../index.html">Home</a>
                    </section>
            <%
                }catch (Exception x){
        out.print("Erro:" + x.getMessage());
    }
    %>
        </section>
    </main>
    
        
</body>
</html>
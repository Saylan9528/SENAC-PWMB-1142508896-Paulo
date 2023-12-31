<%@ page import="java.util.Locale" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Nossos Artigos</title>
    <link rel="stylesheet" href="../assets/CSS/estilo.css"/>
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
        <section id="area-postagens">
    <%
    try {
        // Conex�o
        Connection conecta;
        PreparedStatement st;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tecblog", "root", "");

        // Listagem de dados
        st = conecta.prepareStatement("select * from postagem");
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            String titulo = rs.getString("titulo");
            Date dataPublicacao = rs.getDate("dataPublicacao");
            String conteudo = rs.getString("conteudo");

            // Formate a data no formato desejado
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd 'de' MMMM 'de' yyyy", new Locale("pt", "BR"));
            String dataFormatada = dateFormat.format(dataPublicacao);
    %>
    
        <!-- Abertura postagem -->
        <section class="postagem">
            <h2><%= titulo %></h2>
            <span class="data-post">Postado em <%= dataFormatada %></span>
            <img class="img-post" src="../assets/images/image1" alt="">
            <p><%= conteudo %></p>
            <p class="codigo_post">Postagem ID: <%= rs.getInt("ID") %></p>
            <a href="">Leia mais</a>
        </section>
        <!-- Fechamento postagem -->
    
    <%
    }

    } catch (Exception x) {
        out.print("Erro:" + x.getMessage());
    }
    %>
    </section>
    <section id="area-lateral">
        <section class="conteudo-lateral">
            <h3>Categorias</h3>
            <a href="">Home</a><br>
            <a href="./pages/artigos.jsp">Artigos</a><br>
            <a href="">Celulares</a><br>
            <a href="">Informatica</a><br>
            <a href="">Eletronicos</a>
        </section>
    </section>
    </section>
    </main>
    <footer>
        <section id="rodape">
            todos os direitos reservados
        </section>
    </footer>
</body>
</html>


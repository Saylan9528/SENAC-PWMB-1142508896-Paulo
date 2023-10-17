<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Excluir Postagem</title>
        <meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <%
                    String idPostagem = request.getParameter("ID-postagem");

                    if (idPostagem != null) {
                        try {
                            // Conexão com o banco de dados
                            Connection conecta;
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tecblog", "root", "");

                            //excluir a postagem com base no ID
                            String query = "DELETE FROM postagem WHERE ID = ?";
                            PreparedStatement st = conecta.prepareStatement(query);
                            st.setString(1, idPostagem);

                            // Executar a exclusão
                            int linhasAfetadas = st.executeUpdate();

                            if (linhasAfetadas > 0) {
                %>
                <section id="area-postagens">
                    <section class="postagem">
                        <h2>Postagem Excluida com Sucesso</h2>
                        <img class="img-ex" src="../assets/images/home/sucesso.png" alt="PC">
                        <a href="excluir.jsp">Voltar</a>
                        <a href="../index.html">Home</a>
                    </section>
                    <%
                        }
                    } catch (Exception x) {
                    %>
                    <h2>Erro: <%= x.getMessage()%> entre em contato com o Suporte</h2>
                    <%
                            }
                        }
                    %>
                </section>
                </body>
                </html>

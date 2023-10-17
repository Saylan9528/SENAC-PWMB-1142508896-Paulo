<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Salvar Edição</title>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/CSS/estilo.css"/>
</head>
<body>
    <header>
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
        String postagemID = request.getParameter("ID-postagem");
        String titulo = request.getParameter("titulo");
        String conteudo = request.getParameter("conteudo");

        Connection conecta = null;
        PreparedStatement st = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tecblog", "root", "");

            // Atualizar a postagem com as novas informações
            String updateQuery = "UPDATE postagem SET titulo = ?, conteudo = ? WHERE ID = ?";
            st = conecta.prepareStatement(updateQuery);
            st.setString(1, titulo);
            st.setString(2, conteudo);
            st.setInt(3, Integer.parseInt(postagemID));

            int rowsUpdated = st.executeUpdate();

            if (rowsUpdated > 0) {
    %>
                <section id="area-postagens">
                    <section class="postagem">
                        <h2>Postagem Editada com Sucesso</h2>
                        <img class="img-ex" src="../assets/images/home/sucesso.png" alt="PC">
                        <a href="../index.html">Home</a>
                        <a href="alterar.jsp">Voltar</a>
                    </section>
                
                
    <%
            } else {
    %>
                <h2>Ocorreu um erro ao salvar a edição da postagem.</h2>
    <%
            }
        } catch (Exception e) {
            out.print("Erro: " + e.getMessage());
        } finally {
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conecta != null) {
                try {
                    conecta.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
    </section>
    </main>
    </body>
</html>


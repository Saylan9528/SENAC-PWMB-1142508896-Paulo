<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Postagem</title>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="../assets/CSS/estilo.css" />
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
        <section>
            <%
            String postagemID = request.getParameter("ID-postagem");
            if (postagemID != null) {
                Connection conecta = null;
                PreparedStatement st = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tecblog", "root", "");

                    // Buscar a postagem com base no ID
                    String selectQuery = "SELECT ID, titulo, conteudo FROM postagem WHERE ID = ?";
                    st = conecta.prepareStatement(selectQuery);
                    st.setInt(1, Integer.parseInt(postagemID));
                    rs = st.executeQuery();

                    if (rs.next()) {
                        String titulo = rs.getString("titulo");
                        String conteudo = rs.getString("conteudo");
            %>

            <form method="post" action="salvar_edicao.jsp">
                <h2>Editar Postagem</h2>
                <input type="hidden" name="ID-postagem" value="<%= postagemID %>">
                <label for="titulo">Título:</label>
                <input type="text" id="titulo" name="titulo" value="<%= titulo %>" required>
                <label for="conteudo">Conteúdo:</label>
                <textarea id="conteudo" name="conteudo" rows="6" required><%= conteudo %></textarea>
                <input type="submit" value="Salvar Edição">
            </form>

            <%
                    } else {
                        out.print("Postagem não encontrada.");
                    }
                } catch (Exception x) {
                    out.print("Erro: " + x.getMessage());
                } finally {
                    if (rs != null) {
                        try {
                            rs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
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
            } else {
                out.print("Selecione uma postagem para editar.");
            }
            %>
        </section>
    </main>

    <footer>
        <!-- Seu rodapé aqui -->
    </footer>
</body>
</html>





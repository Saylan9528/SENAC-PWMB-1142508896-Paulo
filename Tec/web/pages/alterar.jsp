<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Postagem</title>
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
        <section>
            <form method="post" action="editar_postagem.jsp">
                <label for="postagem">Selecione a postagem que deseja editar:</label>
                <select id="postagem" name="ID-postagem" required>
                    <option value="">Selecione uma postagem</option>
                    <%
                    try {
                        // Conexão
                        Connection conecta;
                        PreparedStatement st;
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tecblog", "root", "");

                        // Buscar postagens do banco de dados
                        st = conecta.prepareStatement("SELECT ID, titulo FROM postagem");
                        ResultSet rs = st.executeQuery();
                        while (rs.next()) {
                            int id = rs.getInt("ID");
                            String titulo = rs.getString("titulo");
                    %>
                    <option value="<%= id %>">ID: <%= id %> - <%= titulo %></option>
                    <%
                        }
                        } catch (Exception x) {
                            out.print("Erro:" + x.getMessage());
                        }
                    %>
                </select>
                <input type="submit" value="Editar Publicação">
            </form>
        </section>
    </main>
    
    <footer>
    </footer>
</body>
</html>
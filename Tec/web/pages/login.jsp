<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/CSS/estilo.css"/>
</head>
<body>
    <header>
        <nav id ="area-cabecalho">
            <section id="area-logo"><h1>Tec<span class="branco">Blog</span></h1></section>
            <section id="area-menu">
                <a href="../index.html">Home</a>
                <a href="alterar.jsp">Jogos</a>
                <a href="">Celulares</a>
                <a href="">informatica</a>
                <a href="login.html">Login</a>
            </section>
        </nav>
    </header>
    <%
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        Connection conecta = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tecblog", "root", "");

            String selectQuery = "SELECT ID, username FROM login WHERE username = ? AND password = ?";
            st = conecta.prepareStatement(selectQuery);
            st.setString(1, login);
            st.setString(2, senha);
            rs = st.executeQuery();

            if (rs.next()) {
                // Usuário correto
                String username = rs.getString("username");
                // Defina o nome de usuário na sessão para manter o usuário logado
                session.setAttribute("username", username);
                response.sendRedirect("admin.jsp");
            } else {
                // Credenciais incorretas
    %>
    <form action="login.html">
        <p class="negado">Credenciais incorretas</p>
        <input type="submit" value="Tentar Novamente" ><br>
    </form>
    <%
            }
        } catch (Exception x) {
            out.print("Erro: " + x.getMessage());
        }
    %>
</body>
</html>

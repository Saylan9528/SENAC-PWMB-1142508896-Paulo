<%@ page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Página de Admin</title>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <section id="area-postagens">
                <section class="postagem">
        <section>
            <%
            String username = (String) session.getAttribute("username");
            if (username != null) {
            %>
            <h2>Bem-vindo à página de administração, <%= username %>!</h2>
            
            <%
            }
            %>
        </section>
        <section>
            
        </section>
        </section>
        </section>
        <section id="area-lateral">
                    <section class="conteudo-lateral">
                        <h3>Pendencias</h3>
                        <section class="post-lateral">
                            <p>Paginas Assesórios e Informatica</p>
                            
                        </section>
                        <section class="post-lateral">                        
                        </section>
                    </section>
                       <section class="conteudo-lateral">
                            
                        <h3>Urgente</h3>
                        <section class="post-lateral">
                            <p>imagens com Problemas</p>
                            
                        </section>
                        <section class="post-lateral">
                            
                        </section>
        </section>
    </main>
</body>
</html>


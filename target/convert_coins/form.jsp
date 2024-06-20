<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulário de Cadastro</title>
    <a href="#" id="homeLink">Home</a>
</head>
<body>
<jsp:include page="header.jsp" />
<h2>Cadastro de Moeda</h2>
<form action="result.jsp" method="post">
    Nome da Moeda: <input type="text" name="nome"><br>
    <br>
    Símbolo da Moeda: <input type="text" name="sigla"><br>
    <br>
    <input type="submit" value="Cadastrar">
</form>
<br>
<br>


<h2>Moedas Cadastradas</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Símbolo</th>
    </tr>
    <%
        String url = "jdbc:mysql://localhost:3306/convert_coins_db";
        String user = "root";
        String password = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Moeda");

            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String sigla = rs.getString("sigla");
    %>
    <tr>
        <td><%= id %></td>
        <td><%= sigla %></td>
        <td><%= nome %></td>
    </tr>
    <%
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>

</body>
<script>
    document.getElementById("homeLink").addEventListener("click", function () {
        window.location.href = "index.jsp";
    });
</script>
</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resultado do Cadastro</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<%
    String nome = request.getParameter("nome");
    String sigla = request.getParameter("sigla");

    String url = "jdbc:mysql://localhost:3306/convert_coins_db";
    String user = "root";
    String password = "root";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        Statement stmt = con.createStatement();
        stmt.executeUpdate("INSERT INTO Moeda (sigla, nome) VALUES ('" + nome + "', '" + sigla + "')");
        con.close();
        out.println("<h3>Moeda cadastrada com sucesso!</h3>");
        out.println("  <a href=\"#\" id=\"homeLink\">Home</a>");
        out.println("<script>\n" +
                "    document.getElementById(\"homeLink\").addEventListener(\"click\", function () {\n" +
                "        window.location.href = \"index.jsp\";\n" +
                "    });\n" +
                "</script>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>Erro ao cadastrar a moeda: " + e.getMessage() + "</h3>");
    }
%>
<jsp:include page="footer.jsp"/>
</body>
</html>


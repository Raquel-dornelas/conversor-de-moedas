<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<h2>Cadastro de Moedas</h2>
<form action="addMoeda.jsp" method="post">
    Sigla: <input type="text" name="sigla" required>
    Nome: <input type="text" name="nome" required>
    <input type="submit" value="Adicionar">

</form>

<h2>Moedas Cadastradas:</h2>

<h2>Lista de Moedas</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>ISO</th>
        <th>Nome</th>
    </tr>
    <c:forEach var="moeda" items="${moedas}">
        <tr>
            <td>${moeda.id}</td>
            <td>${moeda.sigla}</td>
            <td>${moeda.nome}</td>
        </tr>
    </c:forEach>
</table>


<ul>
    <c:forEach var="moeda" items="${moedas}">
        <li>${moeda.sigla} - ${moeda.nome}</li>
    </c:forEach>
</ul>



<body>

</body>
</html>

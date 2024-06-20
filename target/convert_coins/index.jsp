<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Convert Coins</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h2>Bem-vindo ao Conver Coins!</h2>
<form action="form.jsp" method="get">
    <input type="submit" value="Cadastrar Moeda">
</form>
<br>
<br>
<form action="conversorAPI.jsp" method="get">
    <input type="submit" value="Converter Moeda">
</form>
<br>
<br>
<br>
<jsp:include page="footer.jsp" />
</body>
</html>
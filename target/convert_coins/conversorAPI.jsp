<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Conversor de Moedas</title>
    <a href="#" id="homeLink">Home</a>
</head>
<body>
<h2>Conversor de Moedas</h2>
<form action="CurrencyConverterServlet" method="post">
    <label for="amount">Valor:</label>
    <input type="number" id="amount" name="amount" step="0.01" required>
    <br><br>

    <label for="fromCurrency">De:</label>
    <select id="fromCurrency" name="fromCurrency">
        <option value="USD">USD</option>
        <option value="EUR">EUR</option>
        <option value="BRL">BRL</option>
        <option value="CAD">CAD</option>
        <option value="ARS">ARS</option>
    </select>
    <br><br>

    <label for="toCurrency">Para:</label>
    <select id="toCurrency" name="toCurrency">
        <option value="USD">USD</option>
        <option value="EUR">EUR</option>
        <option value="BRL">BRL</option>
        <option value="CAD">CAD</option>
        <option value="ARS">ARS</option>
    </select>
    <br><br>

    <input type="submit" value="Converter">
</form>
</body>


<script>
    document.getElementById("homeLink").addEventListener("click", function () {
        window.location.href = "index.jsp";
    });
</script>
</html>

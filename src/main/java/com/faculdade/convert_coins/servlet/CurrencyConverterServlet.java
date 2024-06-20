package com.faculdade.convert_coins.servlet;

import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import java.util.logging.Logger;

@WebServlet("/CurrencyConverterServletController")
public class CurrencyConverterServlet extends HttpServlet {

    Logger logger = Logger.getLogger(CurrencyConverterServlet.class.getName());
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String apiKey = "65fc3e62095a585b1c5ff6a7";
        String amountStr = request.getParameter("amount");
        String fromCurrency = request.getParameter("fromCurrency");
        String toCurrency = request.getParameter("toCurrency");

        try {
            double amount = Double.parseDouble(amountStr);
            String urlStr = String.format("https://v6.exchangerate-api.com/v6/%s/latest/%s", apiKey, fromCurrency);
            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                Scanner scanner = new Scanner(new InputStreamReader(conn.getInputStream()));
                StringBuilder jsonStr = new StringBuilder();
                while (scanner.hasNext()) {
                    jsonStr.append(scanner.nextLine());
                }
                scanner.close();

                try {
                    JSONObject jsonObject = new JSONObject(jsonStr.toString());
                    double exchangeRate = jsonObject.getJSONObject("conversion_rates").getDouble(toCurrency);
                    double convertedAmount = amount * exchangeRate;

                    response.setContentType("text/html");
                    response.getWriter().println("<html><body>");
                    response.getWriter().println("<h2>Conversão de Moeda</h2>");
                    response.getWriter().println("<p>Valor: " + amount + " " + fromCurrency + " = " + convertedAmount + " " + toCurrency + "</p>");
                    response.getWriter().println("<a href=\"#\" id=\"homeLink\">Home</a>");
                    response.getWriter().println("<script>\n" +
                            "    document.getElementById(\"homeLink\").addEventListener(\"click\", function () {\n" +
                            "        window.location.href = \"index.jsp\";\n" +
                            "    });\n" +
                            "</script>");
                    response.getWriter().println("</body></html>");

                } catch (Exception e) {
                    response.getWriter().println("Erro ao parsear JSON: " + e.getMessage());
                }
            } else {
                response.getWriter().println("Erro ao obter a taxa de câmbio. Código de resposta: " + responseCode);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erro: " + e.getMessage());
        }
    }
}
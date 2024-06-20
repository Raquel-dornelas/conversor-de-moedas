<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.faculdade.convert_coins.model.Moeda, com.faculdade.convert_coins.dao.MoedaDao"%>
<%@ page import="java.util.logging.Logger"%>
<%
    Logger logger = Logger.getLogger("addMoeda.jsp");

    String sigla = request.getParameter("sigla");
    String nome = request.getParameter("nome");

    if (sigla != null && nome != null && !sigla.isEmpty() && !nome.isEmpty()) {
        try {
            Moeda moeda = new Moeda();
            moeda.setSigla(sigla);
            moeda.setNome(nome);

            MoedaDao moedaDAO = new MoedaDao();
            moedaDAO.saveMoeda(moeda);

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            logger.severe("Erro ao salvar moeda: " + e.getMessage());
            e.printStackTrace();
        }
    } else {
        out.println("sigla e Nome são obrigatórios.");
    }
%>


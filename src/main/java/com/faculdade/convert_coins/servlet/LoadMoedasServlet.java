package com.faculdade.convert_coins.servlet;

import com.faculdade.convert_coins.model.Moeda;
import com.faculdade.convert_coins.util.HibernateUtil;
import org.hibernate.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/formMoedaServlet")
public class LoadMoedasServlet extends HttpServlet {
    Logger logger = Logger.getLogger(LoadMoedasServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("load moedas");

        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        List<Moeda> moedas = session.createQuery("FROM Moeda", Moeda.class).getResultList();

        System.out.println(moedas.get(0));

        logger.info(moedas.get(0).getNome());

        session.getTransaction().commit();
        session.close();

        request.setAttribute("moedas", moedas);
        request.getRequestDispatcher("formMoeda.jsp").forward(request, response);
    }

}


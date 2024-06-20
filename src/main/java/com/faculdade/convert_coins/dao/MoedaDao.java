package com.faculdade.convert_coins.dao;

import com.faculdade.convert_coins.model.Moeda;
import com.faculdade.convert_coins.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class MoedaDao {
    public void saveMoeda(Moeda moeda) {

        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(moeda);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public List<Moeda> getMoedas() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Moeda", Moeda.class).list();
        }
    }
}

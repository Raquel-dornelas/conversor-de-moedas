import com.faculdade.convert_coins.model.Moeda;
import com.faculdade.convert_coins.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class TestConnection {
    public static void main(String[] args) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();

        // Teste uma simples operação no banco de dados
        Moeda moeda = new Moeda();
        moeda.setSigla("USD");
        moeda.setNome("Dollar");
        session.save(moeda);

        session.getTransaction().commit();
        session.close();

        System.out.println("Conexão com o banco de dados estabelecida e Moeda salva com sucesso!");
    }
}

package mybatis;
/*
mybatis工具类
 */
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisUtils {
    private static final String FILE_CONFIG = "mybatis-config.xml";
    private static SqlSessionFactory sqlSessionFactory;

    private MybatisUtils() {
    }

    static {
        InputStream inputStream;
        try {
            //读取mybatis配置文件
            inputStream = org.apache.ibatis.io.Resources.getResourceAsStream(FILE_CONFIG);
            //创建会话工程（连接工厂）
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static SqlSession getSqlSession() {
        return sqlSessionFactory.openSession();
    }
//    public static SqlSession getSqlSessionAutoCommit() {
//        SqlSession session=sqlSessionFactory.openSession(true);
//        return session;
//    }
}

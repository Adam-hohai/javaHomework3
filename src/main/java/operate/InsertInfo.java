package operate;

import javabean.ScoreInfo;
import javabean.StudentInfo;
import mapper.InfoMapper;
import mybatis.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class InsertInfo {
    public void insertScoreInfo(ScoreInfo scoreInfo){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper infoMapper = session.getMapper(InfoMapper.class);
        infoMapper.insertScoreInfo(scoreInfo);
        session.commit();
        session.close();
    }

    public void insertStudentInfo(StudentInfo studentInfo){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper infoMapper = session.getMapper(InfoMapper.class);
        infoMapper.insertStudentInfo(studentInfo);
        session.commit();
        session.close();
    }
}

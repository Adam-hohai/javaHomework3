package operate;

import javabean.ScoreInfo;
import javabean.StudentInfo;
import javabean.SubjectInfo;
import javabean.TotalInfo;
import mapper.InfoMapper;
import mybatis.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class SelectInfo {
    public ScoreInfo[] selectScoreInfo(){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper mapper = session.getMapper(InfoMapper.class);
        ScoreInfo[] objs = mapper.selectScoreInfo();
        session.close();
        return objs;
    }

    public StudentInfo[] selectStudentInfo(){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper mapper = session.getMapper(InfoMapper.class);
        StudentInfo[] objs = mapper.selectStudentInfo();
        session.close();
        return objs;
    }

    public SubjectInfo[] selectSubjectInfo(){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper mapper = session.getMapper(InfoMapper.class);
        SubjectInfo[] objs = mapper.selectSubjectInfo();
        session.close();
        return objs;
    }

    public TotalInfo[] selectTotalInfo(){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper mapper = session.getMapper(InfoMapper.class);
        TotalInfo[] objs = mapper.selectTotalInfo();
        session.close();
        return objs;
    }

    public String selectStudentName(String studentNo){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper mapper = session.getMapper(InfoMapper.class);
        String studentName = mapper.selectStudentName(studentNo);
        session.close();
        return studentName;
    }

    public Long selectStudentId(String studentNo){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper mapper = session.getMapper(InfoMapper.class);
        Long studentId = mapper.selectStudentId(studentNo);
        session.close();
        return studentId;
    }

    public Long selectSubjectId(String subjectName){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper mapper = session.getMapper(InfoMapper.class);
        Long subjectId = mapper.selectSubjectId(subjectName);
        session.close();
        return subjectId;
    }
}

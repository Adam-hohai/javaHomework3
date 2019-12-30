package operate;

import mapper.InfoMapper;
import mybatis.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class UpdateInfo {
    public void UpdateStudentScore(Long studentId, Long subjectId){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper infoMapper = session.getMapper(InfoMapper.class);
        infoMapper.updateStudentScore(studentId, subjectId);
        session.commit();
        session.close();
    }
}

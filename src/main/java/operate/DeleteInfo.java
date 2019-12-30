package operate;

import mapper.InfoMapper;
import mybatis.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class DeleteInfo {
    public void deleteStudentInfo(Long studentId, Long subjectId){
        SqlSession session = MybatisUtils.getSqlSession();
        InfoMapper infoMapper = session.getMapper(InfoMapper.class);
        infoMapper.deleteStudentScore(studentId, subjectId);
        session.commit();
        session.close();
    }
}

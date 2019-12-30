package mapper;

import javabean.ScoreInfo;
import javabean.StudentInfo;
import javabean.SubjectInfo;
import javabean.TotalInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InfoMapper {
    ScoreInfo[] selectScoreInfo();
    StudentInfo[] selectStudentInfo();
    SubjectInfo[] selectSubjectInfo();
    TotalInfo[] selectTotalInfo();
    Long selectStudentId(String studentNo);
    Long selectSubjectId(String subjectName);
    String selectStudentName(String studentNo);
    void insertStudentInfo(StudentInfo studentInfo);
    void insertScoreInfo(ScoreInfo scoreInfo);
    void updateStudentScore(Long studentId, Long subjectId);
    void deleteStudentScore(Long studentId, Long subjectId);
}

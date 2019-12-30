<%@ page import="operate.SelectInfo" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javabean.ScoreInfo" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="operate.InsertInfo" %>
<%@ page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="mybatis.MybatisUtils" %>
<%@ page import="mapper.InfoMapper" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="jdbc.DbUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 周晟昊
  Date: 2019-12-07
  Time: 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //    String studentNo = request.getParameter("studentNo");
////    out.write(studentNo);
//    SelectInfo selectInfo = new SelectInfo();
//    Long studentId = selectInfo.selectStudentId(request.getParameter("studentNo"));
////    out.write(studentId.toString());
//    Long subjectId = selectInfo.selectSubjectId(request.getParameter("subjectName"));
//    BigDecimal studentScore = new BigDecimal(request.getParameter("studentScore"));
////    Double studentScore = Double.valueOf(request.getParameter("studentScore"));
////    out.write(studentScore.toString());
//    Date date = new Date();
//    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//    String modifyTime = sdf.format(date);
////    out.write(modifyTime);
////    SqlSession session1 = MybatisUtils.getSqlSession();
////    InfoMapper mapper = session1.getMapper(InfoMapper.class);
//    ScoreInfo scoreInfo = new ScoreInfo();
//    scoreInfo.setModifyTime(modifyTime);
//    scoreInfo.setStudentId(studentId);
//    scoreInfo.setSubjectId(subjectId);
//    scoreInfo.setStudentScore(studentScore);
////    mapper.insertScoreInfo(scoreInfo);
////    session1.commit();
////    session1.close();
//    InsertInfo insertInfo = new InsertInfo();
//    insertInfo.insertScoreInfo(scoreInfo);
    try {
        Connection conn = DbUtils.getConnection();
        PreparedStatement ps1, ps2, ps3 = null;
        ResultSet rs1, rs2 = null;
        String selectStudentId = "select studentId from StudentInfo where studentNo = ?";
        ps1 = conn.prepareStatement(selectStudentId);
        ps1.setString(1, request.getParameter("studentNo"));
        rs1 = ps1.executeQuery();
        int studentId = 0;
        if(rs1.next()==true){
            studentId = rs1.getInt("studentId");
        }

        String selectSubjectId = "select * from SubjectInfo where subjectName=?";
        ps2 = conn.prepareStatement(selectSubjectId);
        ps2.setString(1, request.getParameter("subjectName"));
        rs2 = ps2.executeQuery();
        int subjectId = 0;
        if(rs2.next()==true){
            subjectId = rs2.getInt("subjectId");
        }
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String modifyTime = sdf.format(date);

        String insertScoreInfo = "insert into ScoreInfo(subjectId,studentId,studentScore,modifyTime) values(?,?,?,?)";
        ps3 = conn.prepareStatement(insertScoreInfo);
        ps3.setInt(1,studentId);
        ps3.setInt(2,subjectId);
        ps3.setString(3,request.getParameter("studentScore"));
        ps3.setString(4,modifyTime);
        ps3.executeUpdate();

        rs1.close();
        rs2.close();
        ps1.close();
        ps2.close();
        ps3.close();
        conn.close();
        out.write("成功");
    } catch (Exception e) {
        e.printStackTrace();
        out.write("失败");
    }


%>

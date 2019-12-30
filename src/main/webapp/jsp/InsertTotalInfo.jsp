<%@ page import="java.sql.Connection" %>
<%@ page import="jdbc.DbUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 周晟昊
  Date: 2019-12-08
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String specialty = request.getParameter("specialty");
    String grade = request.getParameter("grade");
    String studentNo = request.getParameter("studentNo");
    String studentName = request.getParameter("studentName");
    String studentSex = request.getParameter("studentSex");
    String subjectName = request.getParameter("subjectName");
    String studentScore = request.getParameter("studentScore");
    try {
        Connection conn = DbUtils.getConnection();
        PreparedStatement ps1, ps2, ps3, ps4 = null;
        ResultSet rs1, rs2 = null;
        String sql1 = "insert into StudentInfo(specialty,grade,studentNo,studentName,studentSex) values (?,?,?,?,?)";
        ps1 = conn.prepareStatement(sql1);
        ps1.setString(1, specialty);
        ps1.setString(2, grade);
        ps1.setString(3, studentNo);
        ps1.setString(4, studentName);
        ps1.setString(5, studentSex);
        ps1.executeUpdate();

        String sql2 = "select * from StudentInfo where studentNo=?";
        ps2 = conn.prepareStatement(sql2);
        ps2.setString(1, studentNo);
        rs1 = ps2.executeQuery();
        int studentId = 0;
        if(rs1.next() == true){
            studentId = rs1.getInt("studentId");
        }

        String sql3 = "select * from SubjectInfo where subjectName=?";
        ps3 = conn.prepareStatement(sql3);
        ps3.setString(1,subjectName);
        rs2 = ps3.executeQuery();
        int subjectId = 0;
        if(rs2.next() == true){
            subjectId = rs2.getInt("subjectId");
        }

        String sql4 = "insert into ScoreInfo(subjectId,studentId,studentScore,modifyTime) values (?,?,?,?)";
        ps4 = conn.prepareStatement(sql4);
        ps4.setInt(1,subjectId);
        ps4.setInt(2,studentId);
        ps4.setString(3,studentScore);
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String modifyTime = sdf.format(date);
        ps4.setString(4,modifyTime);
        ps4.executeUpdate();

        rs1.close();
        rs2.close();
        ps1.close();
        ps2.close();
        ps3.close();
        ps4.close();
        conn.close();
        out.write("成功");
    } catch (Exception e) {
        e.printStackTrace();
        out.write("失败");
    }

%>>

<%@ page import="java.sql.Connection" %>
<%@ page import="jdbc.DbUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 周晟昊
  Date: 2019-12-09
  Time: 0:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    try{
        Connection conn = DbUtils.getConnection();

        PreparedStatement ps2,ps3;
        ResultSet rs1,rs2;
        String sql2 = "select * from StudentInfo where studentNo=?";
        ps2 = conn.prepareStatement(sql2);
        ps2.setString(1, request.getParameter("studentNo"));
        rs1 = ps2.executeQuery();
        int studentId = 0;
        if(rs1.next() == true){
            studentId = rs1.getInt("studentId");
        }

        String sql3 = "select * from SubjectInfo where subjectName=?";
        ps3 = conn.prepareStatement(sql3);
        ps3.setString(1,request.getParameter("subjectName"));
        rs2 = ps3.executeQuery();
        int subjectId = 0;
        if(rs2.next() == true){
            subjectId = rs2.getInt("subjectId");
        }

        String deleteInfo = "delete from ScoreInfo where studentId =? and subjectId =?";
        PreparedStatement ps = conn.prepareStatement(deleteInfo);
        ps.setInt(1,studentId);
        ps.setInt(2,subjectId);
        ps.executeUpdate();

        ps.close();
        ps2.close();
        ps3.close();
        rs1.close();
        rs2.close();
        conn.close();
        out.write("成功");
    }catch (Exception e){
        out.write("失败");
    }
%>
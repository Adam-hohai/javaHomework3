<%@ page import="operate.SelectInfo" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="jdbc.DbUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 周晟昊
  Date: 2019-12-06
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String studentNo = request.getParameter("studentNo");
//    SelectInfo selectInfo = new SelectInfo();
//    String studentName = selectInfo.selectStudentName(studentNo);
//    if(studentName != ""){
//        Map map = new HashMap();
//        map.put("studentName",studentName);
//        String jsonStr = JSONObject.toJSONString(map);
//        out.write(jsonStr);
//    }

    try {
        Connection conn = DbUtils.getConnection();
        String sql = "select * from StudentInfo where studentNo = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, studentNo);
        ResultSet rs = ps.executeQuery();
        if (rs.next() == true) {
            Map map = new HashMap();
            map.put("studentName", rs.getString("studentName"));
            String jsonstr = JSONObject.toJSONString(map);
            out.write(jsonstr);
        }
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%@ page import="operate.SelectInfo" %>
<%@ page import="javabean.TotalInfo" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%--Created by IntelliJ IDEA.
  User: 周晟昊
  Date: 2019-12-03
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //    SelectInfo selectInfo = new SelectInfo();
//    TotalInfo[] totalInfos = selectInfo.selectTotalInfo();

    //String jsonStr = "";
    //JSONObject jsonObject = JSONObject.fromObject(totalInfos);
    //String str = JSONUtils.valueToString(totalInfos);
//    for(TotalInfo totalInfo : totalInfos){
//       jsonStr += "{\"specialty\":\"" + totalInfo.getSpecialty() + "\",\"grade\":\""+totalInfo.getGrade()
//       +"\",\"studentNo\":\""+totalInfo.getStudentNo()+"\",\"studentName\":\""+totalInfo.getStudentName()+
//       "\",\"studentSex\":\""+totalInfo.getStudentSex()+"\",\"subjectName\":\""+totalInfo.getSubjectName()
//       +"\",\"studentScore\":\""+totalInfo.getStudentScore()+"\"}";
//    }
//    jsonStr = '[' + jsonStr + ']';
    //out.write(jsonObject.toString());
    //out.write(str);
//    List<TotalInfo> list = new ArrayList<>();
//    for(TotalInfo totalInfo : totalInfos){
//        list.add(totalInfo);
//    }
//    String str = JSONUtils.valueToString(list);
//    out.write(str.toString());
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=StudentScore";
        String user = "sa";
        String password = "990919";
        Connection conn = DriverManager.getConnection(url, user, password);

        Statement statement = conn.createStatement();
        ResultSet resultSet = statement.executeQuery("select specialty,grade,studentNo,studentName,studentSex,studentScore,modifyTime,subjectName from ScoreInfo, StudentInfo, SubjectInfo where ScoreInfo.subjectId = SubjectInfo.subjectId and ScoreInfo.studentId = StudentInfo.studentId");
        List<Map> list = new ArrayList<>();
        while(resultSet.next()==true){
            Map map = new HashMap();
            map.put("specialty", resultSet.getString("specialty"));
            map.put("grade", resultSet.getString("grade"));
            map.put("studentNo", resultSet.getString("studentNo"));
            map.put("studentName", resultSet.getString("studentName"));
            map.put("studentSex", resultSet.getString("studentSex"));
            map.put("subjectName", resultSet.getString("subjectName"));
            map.put("studentScore", resultSet.getBigDecimal("studentScore"));
            list.add(map);

        }
        resultSet.close();
        statement.close();
        conn.close();
        String jsonString = JSONArray.toJSONString(list);
        out.write(jsonString);
    } catch (Exception e) {
        e.printStackTrace();
    }
//    List<Map> list = new ArrayList<>();
//
//    for (TotalInfo totalInfo : totalInfos) {
//        Map map = new HashMap();
//        map.put("specialty", totalInfo.getSpecialty());
//        map.put("grade", totalInfo.getGrade());
//        map.put("studentNo", totalInfo.getStudentNo());
//        map.put("studentName", totalInfo.getStudentName());
//        map.put("studentSex", totalInfo.getStudentSex());
//        map.put("subjectName", totalInfo.getSubjectName());
//        map.put("studentScore", totalInfo.getStudentScore());
//        list.add(map);
//        //String strJson = JSONObject.toJSONString(map);
//        //out.write(strJson);
//    }
//    String jsonString = JSONArray.toJSONString(list);
//    out.write(jsonString);

//    JSONObject jsonObject = JSONObject.fromObject(totalInfos);
//    out.write(jsonObject.toString());
%>

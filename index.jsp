<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
  String bookid = request.getParameter("bookid");
  String bookname = request.getParameter("bookname");
  String authorname = request.getParameter("authorname");

  try
  {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/booklist", "root", "New@2023");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("insert into BOOKLIST (bookid,bookname,authorname) values('"+bookid+"','"+bookname+"','"+authorname+"')");
        out.println("Data is successfully inserted!");
  }
  catch(Exception e)
  {
    System.out.print(e);
    e.printStackTrace();
  }
%>
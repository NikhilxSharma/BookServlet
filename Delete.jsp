<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*,java.util.*"%>
<%
  String bookID = request.getParameter("bookID");

  try
  {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/booklist", "root", "New@2023");
    Statement st=conn.createStatement();
    int i=st.executeUpdate("DELETE FROM BOOKLIST WHERE bookID="+bookID);
      out.println("Data Deleted Successfully! <button><a href = 'Display.jsp'>Return</a></button>");
  }
  catch(Exception e)
  {
    System.out.print(e);
    e.printStackTrace();
  }
%>
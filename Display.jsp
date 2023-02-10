<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>
  <TITLE>You Books</TITLE>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
</head>

<div class="text-center mt-2">
  <h1>Your books list</h1>
  <button type="button" class="btn btn-outline-info" data-toggle="tooltip" data-placement="right" title="return to library">
    <a href="Library.html">
      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-left"
        viewBox="0 0 16 16">
        <path fill-rule="evenodd"
          d="M14.5 1.5a.5.5 0 0 1 .5.5v4.8a2.5 2.5 0 0 1-2.5 2.5H2.707l3.347 3.346a.5.5 0 0 1-.708.708l-4.2-4.2a.5.5 0 0 1 0-.708l4-4a.5.5 0 1 1 .708.708L2.707 8.3H12.5A1.5 1.5 0 0 0 14 6.8V2a.5.5 0 0 1 .5-.5z" />
      </svg>
    </a>
  </button>
</div>

<body>

  <% 
    Class.forName("com.mysql.cj.jdbc.Driver"); Connection
    connection=DriverManager.getConnection( "jdbc:mysql://localhost:3306/booklist" ,"root", "New@2023" ); Statement
    statement=connection.createStatement() ; ResultSet resultset=statement.executeQuery("select * from booklist ") ;
            
  %>
  <table class=" table container mt-4">
    <thead class="table-dark">
      <tr>
        <th scope="col">Book ID</th>
        <th scope="col">Book Name</th>
        <th scope="col">Author Name</th>
        <th scope="col">Action</th>
      </tr>
    </thead>
    <tbody>
      <% while(resultset.next()){ %>
        <tr>
          <td>
            <%= resultset.getString(1) %>
          </td>
          <td>
            <%= resultset.getString(2) %>
          </td>
          <td><%= resultset.getString(3) %>
          </td>
          <td><a href="Delete.jsp?bookID=<%=resultset.getString("bookID") %>">
          		<button type = "button">
          		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  				<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
  				<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
				</svg>
          		</button> 
          	</a>
          </td>
        </tr>
        <% } %>
    </tbody>
    </table>
</body>

</html>
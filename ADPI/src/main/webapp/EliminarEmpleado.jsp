<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con;
            String url="jdbc:mysql://localhost/pa";
            String Driver="com.mysql.jdbc.Driver";
            String user="root";
            String clave="";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
            PreparedStatement ps;
            int id=Integer.parseInt(request.getParameter("id"));
            ps=con.prepareStatement("delete from usuario where idUsuario="+id);
            ps.executeUpdate();
            response.sendRedirect("Cuentas-Em.jsp");
        %>
    </body>
</html>

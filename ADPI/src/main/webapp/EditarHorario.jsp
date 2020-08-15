<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            Connection con;
            String url="jdbc:mysql://localhost:3306/pa";
            String Driver="com.mysql.jdbc.Driver";
            String user="root";
            String clave="";
            Class.forName(Driver);
            con=DriverManager.getConnection(url,user,clave);
            PreparedStatement ps;
            ResultSet rs;
            int id=Integer.parseInt(request.getParameter("id"));
            ps=con.prepareStatement("select * from horario where idHorario="+id);
            rs=ps.executeQuery();
            while(rs.next()){
        %>
        
     <center>
        
        <div class="container">
            
            <h1>Modificar usuario</h1>
            
            <hr>
            
            <form action="" method="post" class="form-control" style=" width: 500px; height: 600px">
                <br/>
                
                <div align="left">
                ID:
                <input type="text" readonly="txtid" class="form-control" value="<%=rs.getInt("idHorario")%>"/>
                
                <br/>
                
                Fecha:
                <input type="date" name="DateFecha" class="form-control" value="<%=rs.getDate("Fecha")%>"/>
                
                <br/>
                
                Hora:
                <input type="time" name="DateHora" class="form-control" value="<%=rs.getTime("Hora")%>"/>
                
                <br/>
                
                <input type="submit" name="Actualizar" class=" btn btn-primary btn-lg"/>
                
                <a/> <a/>
                
                <a href="HorarioAlto.jsp">Regresar</a>
                
            </form>
            
        </div>
        <%}%>
        
        <%
            
            if(request.getParameter("Actualizar")!=null){
            
            String fecha=request.getParameter("DateFecha");
            String hora=request.getParameter("DateHora");
            
            Connection cnx=null;
            Statement sta=null;
            
            try{
                
            Class.forName("com.mysql.jdbc.Driver");
            cnx=DriverManager.getConnection("jdbc:mysql://localhost/pa?user=root&password=");
            
            sta=cnx.createStatement();
            sta.executeUpdate("update horario set Fecha='"+fecha+"', Hora='"+hora+"' where idHorario="+id);
            request.getRequestDispatcher("HorarioAlto.jsp").forward(request, response);
            
            }catch(Exception e){
                
                out.println("Ocurrio un error al actualizar el nuevo horario");
                
            }
           }  
        %>
        
        
      </center>
    </body>
</html>

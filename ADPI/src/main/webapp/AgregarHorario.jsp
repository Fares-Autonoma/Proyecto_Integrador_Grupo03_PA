
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <title>JSP Page</title>
        
    </head>
    
    <body>
        
     <center>
        
        <div class="container">
            
            <h1>Agregar Nuevo Horario</h1>
            
            <hr>
            
            <form action="" method="post" class="form-control" style=" width: 500px; height: 350px">
                
                <br/>
                                               
                Fecha:
                <input type="date" name="DateF" class="form-control"/>
                
                <br/>
                                               
                Hora:
                <input type="time" name="DateH" class="form-control"/>
                
                <br/><br/>
                 
                
                <br/><br/><br/>
                                             
                <input type="submit" name="Guardar" class=" btn btn-primary btn-lg"/>
                
                <a/> <a/>
                
                <a href="HorarioAlto.jsp">Regresar</a>
                
            </form>
            
        </div>
        
       
        <%
            
            if(request.getParameter("Guardar")!=null){
            
            String Fech=request.getParameter("DateF");
            String Horr=request.getParameter("DateH");
                                                
            Connection cnx=null;
            ResultSet rs2=null;
            Statement sta=null;
            
            try{
                
            Class.forName("com.mysql.jdbc.Driver");
            cnx=DriverManager.getConnection("jdbc:mysql://localhost/pa?user=root&password=");
            
            sta=cnx.createStatement();
            sta.executeUpdate("insert into Horario(Fecha, Hora) Values('"+Fech+"','"+Horr+"')");
            request.getRequestDispatcher("HorarioAlto.jsp").forward(request, response);
            
            }catch(Exception e){
                
                out.println("Ocurrio un error al guardar el nuevo usuario");
                
            }
           }  
        %>
        
      </center>   
    </body>
    
</html>



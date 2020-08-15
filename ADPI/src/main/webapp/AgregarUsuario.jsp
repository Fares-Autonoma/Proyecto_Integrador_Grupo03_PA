
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
            
            <h1>Agregar nuevo usuario</h1>
            
            <hr>
            
            <form action="" method="post" class="form-control" style=" width: 500px; height: 600px">
                
                <br/>
                
                Nombre:
                <input type="text" name="txtNomClient" class="form-control"/>
                
                <br/>
                
                Apellido:
                <input type="text" name="txtApellClient" class="form-control"/>
                
                <br/>
                
                Correo:
                <input type="text" name="txtCorrClient" class="form-control"/>
                
                <br/>
                
                Teléfono:
                <input type="text" name="txtTelefClient" class="form-control"/>
                
                <br/>
                
                Usuario:
                <input type="text" name="txtUsClient" class="form-control"/>
                
                <br/>
                
                Contraseña:
                <input type="text" name="txtContraClient" class="form-control"/>
                
                <br/>
                
                <input type="submit" name="Guardar" class=" btn btn-primary btn-lg"/>
                
                <a/> <a/>
                
                <a href="CuentasAlto.jsp">Regresar</a>
                 
            </form>
            
        </div>
        
        <%
            
            if(request.getParameter("Guardar")!=null){
            
            String nom=request.getParameter("txtNomClient");
            String apell=request.getParameter("txtApellClient");
            String corr=request.getParameter("txtCorrClient");
            String telef=request.getParameter("txtTelefClient");
            String usar=request.getParameter("txtUsClient");
            String contr=request.getParameter("txtContraClient");
                        
            Connection cnx=null;
            ResultSet rs=null;
            Statement sta=null;
            
            try{
                
            Class.forName("com.mysql.jdbc.Driver");
            cnx=DriverManager.getConnection("jdbc:mysql://localhost/pa?user=root&password=");
            
            sta=cnx.createStatement();
            sta.executeUpdate("insert into cliente(Nombre, Apellidos, Email, Telefono, Usuario, Contraseña)Values('"+nom+"','"+apell+"','"+corr+"','"+telef+"','"+usar+"','"+contr+"')");
            request.getRequestDispatcher("CuentasAlto.jsp").forward(request, response);
            
            }catch(Exception e){
                
                out.println("Ocurrio un error al guardar el nuevo usuario");
                
            }
           }  
        %>
        
        
      </center>   
    
    </body>
    
</html>


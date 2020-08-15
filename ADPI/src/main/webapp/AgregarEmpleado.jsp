
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
                <input type="text" name="txtNomEmp" class="form-control"/>
                
                <br/>
                
                Apellido:
                <input type="text" name="txtApellEmp" class="form-control"/>
                
                <br/>
                
                Correo:
                <input type="text" name="txtCorrEmp" class="form-control"/>
                
                <br/>
                
                Teléfono:
                <input type="text" name="txtTelefEmp" class="form-control"/>
                
                <br/>
                
                Contraseña:
                <input type="text" name="txtContraEmp" class="form-control"/>
                
                <br/>
                
                DNI:
                <input type="text" name="txtDniEmp" class="form-control"/>
                
                <br/>
                
                Dirección:
                <input type="text" name="txtDirecEmp" class="form-control"/>
                
                <br/>
                
                <input type="submit" name="Guardar" class=" btn btn-primary btn-lg"/>
                
                <a/> <a/>
                
                <a href="Cuentas-Em.jsp">Regresar</a>
                
            </form>
            
        </div>
        
        <%
            
            if(request.getParameter("Guardar")!=null){
            
            String nom=request.getParameter("txtNomEmp");
            String apell=request.getParameter("txtNomEmp");
            String corr=request.getParameter("txtCorrEmp");
            String telef=request.getParameter("txtTelefEmp");
            String contr=request.getParameter("txtContraEmp");
            String dni=request.getParameter("txtDniEmp");
            String direcc=request.getParameter("txtDirecEmp");
            
            Connection cnx=null;
            ResultSet rs=null;
            Statement sta=null;
            
            try{
                
            Class.forName("com.mysql.jdbc.Driver");
            cnx=DriverManager.getConnection("jdbc:mysql://localhost/pa?user=root&password=");
            
            sta=cnx.createStatement();
            sta.executeUpdate("insert into usuario(Nombre, Apellido, Correo, Telefono, Contraseña, DNI, Direccion)Values('"+nom+"','"+apell+"','"+corr+"',"+telef+",'"+contr+"',"+dni+",'"+direcc+"')");
            request.getRequestDispatcher("Cuentas-Em.jsp").forward(request, response);
            
            }catch(Exception e){
                
                out.println("Ocurrio un error al guardar el nuevo usuario");
                
            }
           }  
        %>
        
        
      </center>   
    </body>
    
</html>


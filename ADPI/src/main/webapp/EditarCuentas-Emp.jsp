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
            ps=con.prepareStatement("select * from usuario where idUsuario="+id);
            rs=ps.executeQuery();
            while(rs.next()){
        %>
        
     <center>
        
        <div class="container">
            
            <h1>Modificar usuario</h1>
            
            <hr>
            
            <form action="" method="post" class="form-control" style=" width: 500px; height: 600px">
                <br/>
                
                ID:
                <input type="text" readonly="txtid" class="form-control" value="<%=rs.getInt("idUsuario")%>"/>
                
                <br/>
                
                Nombre:
                <input type="text" name="txtNomEmp" class="form-control" value="<%=rs.getString("Nombre")%>"/>
                
                <br/>
                
                Apellido:
                <input type="text" name="txtApellEmp" class="form-control" value="<%=rs.getString("Apellido")%>"/>
                
                <br/>
                
                Correo:
                <input type="text" name="txtCorrEmp" class="form-control" value="<%=rs.getString("Correo")%>"/>
                
                <br/>
                
                Teléfono:
                <input type="text" name="txtTelefEmp" class="form-control" value="<%=rs.getString("Telefono")%>"/>
                
                <br/>
                
                Contraseña:
                <input type="text" name="txtContraEmp" class="form-control" value="<%=rs.getString("Contraseña")%>"/>
                
                <br/>
                
                DNI:
                <input type="text" name="txtDniEmp" class="form-control" value="<%=rs.getString("DNI")%>"/>
                
                <br/>
                
                Dirección:
                <input type="text" name="txtDirecEmp" class="form-control" value="<%=rs.getString("Direccion")%>"/>
                
                <br/>
                
                <input type="submit" name="Actualizar" class=" btn btn-primary btn-lg"/>
                
                <a/> <a/>
                
                <a href="Cuentas-Em.jsp">Regresar</a>
                
            </form>
            
        </div>
        <%}%>
        
        <%
            
            if(request.getParameter("Actualizar")!=null){
            
            String nom=request.getParameter("txtNomEmp");
            String apell=request.getParameter("txtApellEmp");
            String corr=request.getParameter("txtCorrEmp");
            String telef=request.getParameter("txtTelefEmp");
            String contr=request.getParameter("txtContraEmp");
            String dni=request.getParameter("txtDniEmp");
            String direcc=request.getParameter("txtDirecEmp");
            
            Connection cnx=null;
            Statement sta=null;
            
            try{
                
            Class.forName("com.mysql.jdbc.Driver");
            cnx=DriverManager.getConnection("jdbc:mysql://localhost/pa?user=root&password=");
            
            sta=cnx.createStatement();
            sta.executeUpdate("update usuario set Nombre='"+nom+"', Apellido='"+apell+"', Correo='"+corr+"', Telefono="+telef+", Contraseña='"+contr+"', DNI="+dni+", Direccion='"+direcc+"' where idUsuario="+id);
            request.getRequestDispatcher("Cuentas-Em.jsp").forward(request, response);
            
            }catch(Exception e){
                
                out.println("Ocurrio un error al actualizar el nuevo usuario");
                
            }
           }  
        %>
        
        
      </center>   
    </body>
    
</html>
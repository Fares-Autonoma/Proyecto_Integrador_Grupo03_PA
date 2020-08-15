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
            ps=con.prepareStatement("select * from cliente where idCliente="+id);
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
                <input type="text" readonly="txtid" class="form-control" value="<%=rs.getInt("idCliente")%>"/>
                
                <br/>
                
                Nombre:
                <input type="text" name="txtNomClient" class="form-control" value="<%=rs.getString("Nombre")%>"/>
                
                <br/>
                
                Apellido:
                <input type="text" name="txtApellClient" class="form-control" value="<%=rs.getString("Apellidos")%>"/>
                
                <br/>
                
                Correo:
                <input type="text" name="txtCorrClient" class="form-control" value="<%=rs.getString("Email")%>"/>
                
                <br/>
                
                Teléfono:
                <input type="text" name="txtTelefClient" class="form-control" value="<%=rs.getString("Telefono")%>"/>
                
                <br/>
                
                Usuario:
                <input type="text" name="txtUsClient" class="form-control" value="<%=rs.getString("Usuario")%>"/>
                
                <br/>
                
                Contraseña:
                <input type="text" name="txtContraClient" class="form-control" value="<%=rs.getString("Contraseña")%>"/>
                
                </div>
                <br/>
                
                <input type="submit" name="Actualizar" class=" btn btn-primary btn-lg"/>
                
                <a/> <a/>
                
                <a href="CuentasAlto.jsp">Regresar</a>
                
            </form>
            
        </div>
        <%}%>
        
        <%
            
            if(request.getParameter("Actualizar")!=null){
            
            String nom=request.getParameter("txtNomClient");
            String apell=request.getParameter("txtApellClient");
            String corr=request.getParameter("txtCorrClient");
            String telef=request.getParameter("txtTelefClient");
            String usu=request.getParameter("txtUsClient");
            String contr=request.getParameter("txtContraClient");
            
            Connection cnx=null;
            Statement sta=null;
            
            try{
                
            Class.forName("com.mysql.jdbc.Driver");
            cnx=DriverManager.getConnection("jdbc:mysql://localhost/pa?user=root&password=");
            
            sta=cnx.createStatement();
            sta.executeUpdate("update cliente set Nombre='"+nom+"', Apellidos='"+apell+"', Email='"+corr+"', Telefono='"+telef+"', Usuario='"+usu+"', Contraseña='"+contr+"' where idCliente="+id);
            request.getRequestDispatcher("CuentasAlto.jsp").forward(request, response);
            
            }catch(Exception e){
                
                out.println("Ocurrio un error al actualizar el nuevo usuario");
                
            }
           }  
        %>
        
        
      </center>   
    </body>
    
</html>
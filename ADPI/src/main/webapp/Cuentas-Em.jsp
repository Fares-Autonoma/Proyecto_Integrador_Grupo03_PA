<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <head>
        
        <link href="Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        
        <script>
            
            function Volver(){
         
                    window.document.V.action="<%=request.getContextPath()%>/MantenimientoAlto.jsp";
                    window.document.V.method="GET";
                    window.document.V.submit();
                    
            }
            
        </script>
        
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
            ResultSet rs;
            ps=con.prepareStatement("select * From usuario");
            rs=ps.executeQuery();
            
        %>
        
     <ceter>     
        
        <div class="container">
            
            <center><h1>Usuarios</h1></center>
            
            <hr>
            
            <a class="btn btn-success btn-lg" href="AgregarEmpleado.jsp">Nuevo registro</a>
            
            <br/><br/>
            
            <table class="table table-bordered">
                
                <tr>
                    
                    <th class="text-center">IdUsuario</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Apellido</th>
                    <th class="text-center">Correo</th>
                    <th class="text-center">Teléfono</th>
                    <th class="text-center">Contraseña</th>
                    <th class="text-center">DNI</th>
                    <th class="text-center">Dirección</th>
                    <th class="text-center">Acciones</th>
                    
                </tr>
                
                <%
                    
                    while(rs.next()){
                  
               %>
               
               <tr>
                  
                   <td class="text-center"><%= rs.getInt("IdUsuario")%></td>
                   <td class="text-center"><%= rs.getString("Nombre")%></td>
                   <td class="text-center"><%= rs.getString("Apellido")%></td>
                   <td class="text-center"><%= rs.getString("Correo")%></td>
                   <td class="text-center"><%= rs.getInt("Telefono")%></td>
                   <td class="text-center"><%= rs.getString("Contraseña")%></td>
                   <td class="text-center"><%= rs.getInt("DNI")%></td>
                   <td class="text-center"><%= rs.getString("Direccion")%></td>
                   <td class="text-center">
                       
                       <a href="Editar.jsp?id=<%= rs.getInt("IdUsuario")%>" class="btn btn-warning btn-sm">Editar</a>
                       
                       <a></a> 
                       
                       <a href="Eliminar.jsp?id=<%= rs.getInt("IdUsuario")%>" class="btn btn-warning btn-sm">Eliminar</a>
                       
                   </td>
                   
               </tr>
               
               <%}%>
               
            </table>
            
        </div>
      
     </ceter>   
    
    <form name="V">
    
    <center><input type="button" value="Volver" id="boton" onclick="Volver()"></center>
    
    </form>
    
    </body>
    
</html>



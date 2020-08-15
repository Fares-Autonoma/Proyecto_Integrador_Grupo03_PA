
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>


<!DOCTYPE html>

<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href="Css/EstiloM2.css" rel="stylesheet">
        
        <link href="Css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <title>Mantenimiento</title>
        
    </head>
    
    <body>
        
        <header class="header">
            
            <div class="container logo-nav-container">
                
                <a href="#" class="LogoM">Mantenimiento</a>
                
                <span class="menu-icon">Menú</span>
                
                <nav class="navegador">
                    
                    <br/>
                    
                    <ul>
                        
                        <li><a href="Cuentas.jsp">CUENTAS</a></li>
                        <li><a href="Próximamente.jsp">CATALOGO</a></li>
                        <li><a href="Compras.jsp">COMPRAS</a></li>
                        <li><a href="HorarioMantenimiento.jsp">HORARIOS</a></li>
                        <li><a href="index.jsp">VOLVER</a></li>
                        
                    </ul>
                   
                </nav>
                
            </div>
            
        </header>
        
         <br/><br/>
         <br/><br/>
         <br/>
        
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
            ps=con.prepareStatement("select * From pedidos");
            rs=ps.executeQuery();
            
        %>
        
     <ceter>     
        
        <div class="container">
            
            <h1>Pedidos</h1>
            
            <hr>
            
            <table class="table table-bordered">
                
                <tr>
                    
                    <th class="text-center">idPedido</th>
                    <th class="text-center">idComida</th>
                    <th class="text-center">idBebida</th>
                    <th class="text-center">idUsuario</th>
                    <th class="text-center">idCliente</th>
                    <th class="text-center">idHorario</th>
                    <th class="text-center">Costo</th>
                    <th class="text-center">Acción</th>
                    
                </tr>
                
                <%
                    
                    while(rs.next()){
                  
               %>
               
               <tr>
                  
                   <td class="text-center"><%= rs.getInt("idPedido")%></td>
                   <td class="text-center"><%= rs.getInt("idComida")%></td>
                   <td class="text-center"><%= rs.getInt("idBebida")%></td>
                   <td class="text-center"><%= rs.getInt("idUsuario")%></td>
                   <td class="text-center"><%= rs.getInt("idCliente")%></td>
                   <td class="text-center"><%= rs.getInt("idHorario")%></td>
                   <td class="text-center"><%= rs.getDouble("Costo")%></td>
                    <td class="text-center">   
                       <a class="btn btn-warning btn-sm">Editar</a>
                       
                       <a></a> 
                       
                       <a class="btn btn-warning btn-sm">Eliminar</a>
                       
                    </td>
                   
               </tr>
               
               <%}%>
               
            </table>
            
        </div>
      
     </ceter>   
        
        <footer class="footer">
            
            <div class="container">
                
                <p> TODOS LO DERECHOS RESERVADOS PARA CINEPLANET </p>
                
            </div>
            
        </footer>
        
        <section>
            
        </section>
        
        <script src="js/jquery.min.js ">   </script>
        <script src="js/bootstrap.min.js "></script>
        <script src="js/ContBarMan.js"></script>
        
    </body>
    
</html>

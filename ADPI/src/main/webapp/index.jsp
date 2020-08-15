
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="Css/EstiloI2.css" rel="stylesheet" type="text/css"/>
        
        <title>JSP Page</title>
   
    <script>
            
            function  iniciar1(){	 
                document.EMPRESA.action="<%=request.getContextPath()%>/LoginCliente.jsp";
                document.EMPRESA.method="POST";
                document.EMPRESA.submit();
            }
            
            function  iniciar2(){	 
                document.EMPRESA.action="<%=request.getContextPath()%>/LoginEmpleado.jsp";
                document.EMPRESA.method="POST";
                document.EMPRESA.submit();
            }
            
            function  iniciar3(){	 
                document.EMPRESA.action="<%=request.getContextPath()%>/LoginAdministrador.jsp";
                document.EMPRESA.method="POST";
                document.EMPRESA.submit();
            }
            
        </script>
        
    </head>
    
    <body>  
        
    <center>
            
        <img src="Imagenes/encabezado.jpg" width="75%"/>
                
    </center>    
        
        <div id="Cuadro">
            
            <form name="EMPRESA">
                
            <br><br>
            <center>
                <button onclick="iniciar1()" >
                    <center>  <img  src="Imagenes/icon-estudiante.png" width="100px" height="100px"></center><br> Cliente
                </button> 
        
                <button onclick="iniciar2()" >
                    <center>  <img  src="Imagenes/trabajador.jpeg" width="100px" height="100px"></center><br> Empleado
                </button>
                
                <button onclick="iniciar3()" >
                    <center>  <img  src="Imagenes/admin.jpeg" width="100px" height="100px"></center><br> Administrador
                </button>
            </center> 
                
            </form>
            
            <br/><br/>
            
            <p id="marca">CINE PLANET</p>
            
        </div>
        
    </body>
    
</html>


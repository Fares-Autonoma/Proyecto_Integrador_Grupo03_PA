
package Datos;

import java.io.PrintWriter;

public class DatosUs {
    
    public boolean validarUsuario (String Usuario, String Clave){
        
      boolean estado;
      
      if(Usuario.equals("Fares") && Clave.equals("123456")){
          
          estado=true;
          
      } else{
          
          estado=false;
          
      }
          
       
     return estado;
          
    }
    
}

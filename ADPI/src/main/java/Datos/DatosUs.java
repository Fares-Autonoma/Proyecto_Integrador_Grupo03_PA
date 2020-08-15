package Datos;

import Bean.*;
import Util.ConectorBD;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DatosUs {
    
    Connection                      cn=null;
    PreparedStatement               pt=null;
    ResultSet                       rs=null;
    ArrayList<UsuarioBean>          lista=null;
    UsuarioBean                     objUsuarioBean=null;
    
    public int ValidarUsuario(UsuarioBean objUsuarioBean){
        int val=0;
        try {
            cn=ConectorBD.getConectorBD();
            pt=cn.prepareStatement("SELECT COUNT(*) FROM usuario WHERE CORREO=? AND CONTRASEÑA=?");
            pt.setString(1, objUsuarioBean.getCORREO());
            pt.setString(2, objUsuarioBean.getCONTRASEÑA());
            rs=pt.executeQuery();
            if(rs.next())
            { val=rs.getInt(1);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
            
        }
        return val;
    }
    
    public UsuarioBean DatosUsuario(UsuarioBean objUsuarioBean){
        UsuarioBean  obj=null;
        try {
            cn=ConectorBD.getConectorBD();
            pt=cn.prepareStatement("SELECT * FROM usuario WHERE CORREO=? AND CONTRASEÑA=?");
            pt.setString(1, objUsuarioBean.getCORREO());
            pt.setString(2, objUsuarioBean.getCONTRASEÑA());
            rs=pt.executeQuery();
            if(rs.next()){
              obj=new UsuarioBean();
              obj.setIDUSUARIO(rs.getInt(1));
              obj.setNOMBRE(rs.getString(2));
              obj.setAPELLIDO(rs.getString(3));
              obj.setCORREO(rs.getString(4));
              obj.setTELEFONO(rs.getString(5));
              obj.setCONTRASEÑA(rs.getString(6));
              obj.setDNI(rs.getInt(7));
              obj.setDIRECCION(rs.getString(8));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return obj;
    }  
}
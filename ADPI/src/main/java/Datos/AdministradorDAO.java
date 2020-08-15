package Datos;
import Bean.*;
import Util.ConectorBD;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdministradorDAO {
    Connection                      cn=null;
    PreparedStatement               pt=null;
    ResultSet                       rs=null;
    ArrayList<AdministradorBean>    lista=null;
    AdministradorBean               objAdministradorBean=null;
    
    public int ValidarAdministrador(AdministradorBean objAdministradorBean){
        int val=0;
        try {
            cn=ConectorBD.getConectorBD();
            pt=cn.prepareStatement("SELECT COUNT(*) FROM administrador WHERE CORREO=? AND CONTRASEÑA=?");
            pt.setString(1, objAdministradorBean.getCORREO());
            pt.setString(2, objAdministradorBean.getCONTRASEÑA());
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
    
    public AdministradorBean DatosAdministrador(AdministradorBean objAdministradorBean){
        AdministradorBean  obj=null;
        try {
            cn=ConectorBD.getConectorBD();
            pt=cn.prepareStatement("SELECT * FROM administrador WHERE CORREO=? AND CONTRASEÑA=?");
            pt.setString(1, objAdministradorBean.getCORREO());
            pt.setString(2, objAdministradorBean.getCONTRASEÑA());
            rs=pt.executeQuery();
            if(rs.next()){
              obj=new AdministradorBean();
              obj.setIDADMINISTRADOR(rs.getInt(1));
              obj.setNOMBRE(rs.getString(2));
              obj.setAPELLIDO(rs.getString(3));
              obj.setCORREO(rs.getString(4));
              obj.setDIRECCION(rs.getString(6));
              obj.setTELEFONO(rs.getInt(7));
              obj.setDNI(rs.getInt(8));
              obj.setCONTRASEÑA(rs.getString(9));
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return obj;
    }
}


package Util;

import java.sql.*;

public class ConectorBD {

    public static Connection getConectorBD(){
        
        Connection cn=null;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
             cn=DriverManager.getConnection("jdbc:mysql://localhost/pa","root","");
            System.out.println("Yey!");
        } catch (Exception e){
            
            System.out.println("D:");
            
        }
        
        return  cn;
        
    }
    
    public static void main(String[] args) {
        
        getConectorBD();
        
    }
    
}

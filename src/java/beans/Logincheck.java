/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans;

/**
 *
 * @author SANYAM
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class Logincheck {
    private String name;
    
    private String password;

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    public int check() throws ClassNotFoundException,SQLException{
        System.out.println("called");
        int a=0;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connected");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();
            
            String s3 = "select * from superuser";
            PreparedStatement p3 = con.prepareStatement(s3);
            ResultSet rs3 = p3.executeQuery();
            
            while(rs3.next()){
                String n = (String)rs3.getString("name");
                String pa = (String)rs3.getString("pass");
                System.out.println("\n Name: " + n + " Password: " + pa);
//                nx = String.valueOf(name.equals(n)) + String.valueOf(password.equals(pa)) + String.valueOf(password != null) + String.valueOf(m.matches());
                if(name.equals(n) && password.equals(pa)){
                    System.out.println("Correct Login!!!");
                    a=1;
                    break;
                }
            }
            
            if(a==0){
                String s1 = "select * from user";
                System.out.println("sucess");
                PreparedStatement p = con.prepareStatement(s1);
                ResultSet rs = p.executeQuery();

                while(rs.next()){
                    String n = (String)rs.getString("name");
                    String pa = (String)rs.getString("pass");
                    System.out.println("\n Name: " + n + " Password: " + pa);
    //              nx = String.valueOf(name.equals(n)) + String.valueOf(password.equals(pa)) + String.valueOf(password != null) + String.valueOf(m.matches());
                    if(name.equals(n) && password.equals(pa)){
                        System.out.println("Correct Login!!!");
                        a=2;
                        break;
                    }
                }
            }
            s.executeUpdate(s3);
        }catch(Exception e){
            System.out.println(e);
        }
        return a;
    }
}

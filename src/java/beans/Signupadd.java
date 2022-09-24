/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author SANYAM
 */
public class Signupadd {
    private String name;
    private String password;
    private String confirmPassword;
    
    private String err = "";

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

    /**
     * @return the confirmPassowrd
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * @param confirmPassowrd the confirmPassowrd to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
    
    public int add() throws ClassNotFoundException,SQLException{
        System.out.println("called");
        int a=1;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connected");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();
            String s1 = "select * from user";
            System.out.println("sucess");
            PreparedStatement p = con.prepareStatement(s1);
            ResultSet rs = p.executeQuery();

            String regex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$";
            
            Pattern pt = Pattern.compile(regex);
            Matcher m = pt.matcher(password);
            
            while(rs.next()){
                String n = (String)rs.getString("name");
                String pa = (String)rs.getString("pass");
                System.out.println("\n Name: " + n + " Password: " + pa);
                if(password == null || !m.matches()){
                    err = "Please enter a strong password!";
                    a=0;
                    break;
                }
                if(name.equalsIgnoreCase(n) || password.equals(pa)){
                    err = "Username/Password already exist!";
                    a=0;
                    break;
                }
            }
            
            if(!confirmPassword.equals(password)){
                err = "Confirm Password doesn't match with given Password!";
                a=0;
            }
            
            if(a==1){
                String s2 = "insert into user(name, pass) " + "values (?,?)";
                PreparedStatement ps = con.prepareStatement(s2);
                ps.setString(1, name);
                ps.setString(2, password);
                ps.executeUpdate();
                String s3 = "insert into customer(name, amount) " + "values (?,?)";
                PreparedStatement ps1 = con.prepareStatement(s3);
                ps1.setString(1, name);
                ps1.setString(2, "Rs. 0");
                ps1.executeUpdate();
                System.out.println("updated");
            }

            s.executeUpdate(s1);
        }catch(Exception e){
            System.out.println(e);
        }
        return a;
    }
    
    public String err(){
        return err;
    }
}

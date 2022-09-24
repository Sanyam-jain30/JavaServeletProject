/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans;

import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author SANYAM
 */
public class Addproduct {
    private String url;
    private String name;
    private String value;
    private String err = "";

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }

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
     * @return the value
     */
    public String getValue() {
        return value;
    }

    /**
     * @param value the value to set
     */
    public void setValue(String value) {
        this.value = value;
    }
    
    public int add() throws ClassNotFoundException,SQLException{
        System.out.println("called");
        int a=0;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connected");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();

            try{
                new URL(url).toURI();
                a=1;
            }
            catch(Exception e){
                err = "Please enter a valid url!";
                a=0;
            }
            
            if((value.substring(0, 4)).equals("Rs. ")){
                a=1;
            }
            else{
                err = "Please use 'Rs. ' in price field";
                a=0;
            }
            
            if(a==1){
                String s9 = "select * from product";
                PreparedStatement p5 = con.prepareStatement(s9);
                ResultSet rs5 = p5.executeQuery();

                while(rs5.next()){
                    String ur = (String)rs5.getString("url");
                    String n = (String)rs5.getString("name");
                    if(url.equals(ur) || name.equals(n)){
                        err = "Product name/URL already exist!";
                        a=0;
                        break;
                    }
                }

                if(a==1){
                    String s7 = "insert into product(url, name, price)" + "values(?,?,?)";
                    PreparedStatement p7 = con.prepareStatement(s7);
                    p7.setString(1, url);
                    p7.setString(2, name);
                    p7.setString(3, value);
                    p7.executeUpdate();
                }
            }

        }catch(Exception e){
            System.out.println(e);
        }
        return a;
    }
    
    public int remove() throws ClassNotFoundException,SQLException{
        System.out.println("called");
        int a=0;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connected");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();
            
            String s9 = "select * from product";
            PreparedStatement p5 = con.prepareStatement(s9);
            ResultSet rs5 = p5.executeQuery();

            while(rs5.next()){
                String n = (String)rs5.getString("name");
                if(name.equals(n)){
                    err = "";
                    a=1;
                    break;
                }
                else{
                    err = "Product doesn't exist!";
                }
            }

            if(a==1){
                String s7 = "delete from product where name=?";
                PreparedStatement p7 = con.prepareStatement(s7);
                p7.setString(1, name);
                p7.executeUpdate();
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        return a;
    }
    
    public String err(){
        return err;
    }
}

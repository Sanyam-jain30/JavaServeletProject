/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans;

import java.text.NumberFormat;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Locale;

/**
 *
 * @author SANYAM
 */

public class Bookings {
    private String name;
    private String product;
    private String value;
    private String quantity;
    private String err = "";
    private String total="";

    /**
     * @return the product
     */
    public String getProduct() {
        return product;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(String product) {
        this.product = product;
    }

    public int add() throws ClassNotFoundException,SQLException{
        System.out.println("called");
        int a=0;
        double finalvalue = 0;
        String quan = "";
        String v = value;
        Locale indiaLocale = new Locale("en", "IN");
        NumberFormat india  = NumberFormat.getCurrencyInstance(indiaLocale);
        
        try{
            if(Integer.parseInt(quantity) > 0){
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Connected");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
                Statement s = con.createStatement();

                String s9 = "select * from product";
                PreparedStatement p5 = con.prepareStatement(s9);
                ResultSet rs5 = p5.executeQuery();

                while(rs5.next()){
                    String pr = (String)rs5.getString("name");
                    if(product.equals(pr)){
                        value = (String)rs5.getString("price");
                    }
                }

                String s5 = "select * from booking";
                System.out.println("sucess");
                PreparedStatement p1 = con.prepareStatement(s5);
                ResultSet rs1 = p1.executeQuery();

                while(rs1.next()){
                    String n = (String)rs1.getString("name");
                    String pa = (String)rs1.getString("product");
                    if(name.equals(n) && product.equals(pa)){
                        quan = (String)rs1.getString("quantity");
                        a=1;
                        break;
                    }
                }
                
                discount();

                if(a==1){
                    String s2 = "update booking set quantity=? where name=? and product=?";
                    PreparedStatement ps = con.prepareStatement(s2);
                    ps.setString(1, String.valueOf(Integer.parseInt(quan) + Integer.parseInt(quantity)));
                    ps.setString(2, name);
                    ps.setString(3, product);
                    ps.executeUpdate();
                    System.out.println("updated");
                }
                else{
                    String s2 = "insert into booking(name, product, value, quantity)" + "values (?,?,?,?)";
                    PreparedStatement ps = con.prepareStatement(s2);
                    ps.setString(1, name);
                    ps.setString(2, product);
                    ps.setString(3, value);
                    ps.setString(4, quantity);
                    ps.executeUpdate();
                    System.out.println("updated");
                }

                String s1 = "select * from customer";
                System.out.println("sucess");
                PreparedStatement p = con.prepareStatement(s1);
                ResultSet rs = p.executeQuery();

                while(rs.next()){
                    v = value;
                    String n = rs.getString("name");
                    String am = rs.getString("amount");
                    am = am.substring(4, am.length());
                    am = am.replaceAll(",", "");
                    v = v.substring(4, v.length());
                    v = v.replaceAll(",", "");
                    if(name.equals(n)){
                        finalvalue = Double.parseDouble(am) + Integer.parseInt(quantity) * Double.parseDouble(v);
                        a=1;
                        break;
                    }
                }

                if(a==1){
                    String format = "Rs. " + (String)((india.format(finalvalue)).substring(1));
                    total = format;
                    String s4 = "update customer set amount=? where name=?";
                    PreparedStatement ps1 = con.prepareStatement(s4);
                    ps1.setString(1, format);
                    ps1.setString(2, name);
                    ps1.executeUpdate();
                    System.out.println("updated");
                }

                p1.executeUpdate();
                p.executeUpdate();
                s.execute(s1);
            }
            else{
                err = "please enter a valid quantity";
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return a;
    }
    
    public int remove() throws ClassNotFoundException,SQLException{
        System.out.println("called");
        int a=0;
        double finalvalue = 0;
        String am = "";
        String v = "";
        String quan = "";
        Locale indiaLocale = new Locale("en", "IN");
        NumberFormat india  = NumberFormat.getCurrencyInstance(indiaLocale);
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connected");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();
            
            String s5 = "select * from booking";
            System.out.println("sucess");
            PreparedStatement p1 = con.prepareStatement(s5);
            ResultSet rs1 = p1.executeQuery();

            while(rs1.next()){
                String n = (String)rs1.getString("name");
                String pa = (String)rs1.getString("product");
                if(name.equals(n) && product.equals(pa)){
                    value = (String)rs1.getString("value");
                    quan = (String)rs1.getString("quantity");
                    a=1;
                    break;
                }
            }
            
            
            if(a==1){
//                String s9 = "select * from product";
//                PreparedStatement p5 = con.prepareStatement(s9);
//                ResultSet rs5 = p5.executeQuery();
//
//                while(rs5.next()){
//                    String pr = (String)rs5.getString("name");
//                    if(product.equals(pr)){
//                        value = (String)rs5.getString("price");
//                    }
//                }
//                
//                discount();
                
                int totalquan = Integer.parseInt(quan)-Integer.parseInt(quantity);

                if(totalquan >= 0){
                    String s2 = "update booking set quantity=? where name=? and product=?";
                    PreparedStatement ps = con.prepareStatement(s2);
                    ps.setString(1, String.valueOf(totalquan));
                    ps.setString(2, name);
                    ps.setString(3, product);
                    ps.executeUpdate();
                    System.out.println("updated");

                    String s1 = "select * from customer";
                    System.out.println("sucess");
                    PreparedStatement p = con.prepareStatement(s1);
                    ResultSet rs = p.executeQuery();

                    while(rs.next()){
                        v = value;
                        String n = rs.getString("name");
                        am = rs.getString("amount");
                        am = am.substring(4, am.length());
                        am = am.replaceAll(",", "");
                        v = v.substring(4, v.length());
                        v = v.replaceAll(",", "");
                        if(name.equals(n)){
                            finalvalue = Double.parseDouble(am) - Integer.parseInt(quantity) * Double.parseDouble(v);
                            a=2;
                            break;
                        }
                    }

                    if(a==2){
                        String s8 = "delete from booking where quantity=0";
                        PreparedStatement ps4 = con.prepareStatement(s8);
                        ps4.executeUpdate();
                        String format = "Rs. " + (String)((india.format(finalvalue)).substring(1));
                        total = format;
                        String s4 = "update customer set amount=? where name=?";
                        PreparedStatement ps1 = con.prepareStatement(s4);
                        ps1.setString(1, format);
                        ps1.setString(2, name);
                        ps1.executeUpdate();
                        System.out.println("updated");
                    }
                    p1.executeUpdate();
                    p.executeUpdate();
                    s.execute(s1);
                }
                else{
                    err = "Quantity given for canceling booking exceeds the existing, please try again!";
                }
            }
            else{
                err = "Product not booked, please try again!";
            }
            
        }catch(Exception e){
            System.out.println(e);
        }
        
        return a;
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
     * @return the quantity
     */
    public String getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    
    public String err(){
        return err;
    }
    
    public String totalamount(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connected");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();
            String s1 = "select * from customer";
            System.out.println("sucess");
            PreparedStatement p = con.prepareStatement(s1);
            ResultSet rs = p.executeQuery();

            while(rs.next()){
                String n = rs.getString("name");
                if(name.equals(n)){
                    total = rs.getString("amount");
                    break;
                }
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return total;
    }
    
    public String discount(){
        String v = value;
        Locale indiaLocale = new Locale("en", "IN");
        NumberFormat india  = NumberFormat.getCurrencyInstance(indiaLocale);
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
                if(name.equals(n)){
                    v = v.substring(4, v.length());
                    v = v.replaceAll(",", "");
                    v = String.valueOf((int)((9 * Integer.parseInt(v))/10));
                    v = "Rs. " + (String)(india.format(Integer.parseInt(v)).substring(1, v.length()+2));
                    value = v;
                    break;
                }
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
        return v;
    }
}

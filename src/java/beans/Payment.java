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
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author SANYAM
 */
public class Payment {
    private String name;
    private String amount;
    private String type;
    
    private String err = "";
    /**
     * @return the amount
     */
    public String getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(String amount) {
        this.amount = amount;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }
    
    public String pay() throws ClassNotFoundException,SQLException{
        Locale indiaLocale = new Locale("en", "IN");
        NumberFormat india  = NumberFormat.getCurrencyInstance(indiaLocale);

        int a=0;
        String am = amount;
        String oldv = "";
        String discount = "";
        double amt = 0;
        double mid = 0;
        double total = 0;
        
        try{
            if(type.equals("Check")){
                discount = "5%";
                
            }
            else if(type.equals("Cash")){
                discount = "10%";
                
            }
            else{
                discount = "0%";
            }
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();
            String s1 = "select * from customer";
            System.out.println("sucess");
            PreparedStatement p = con.prepareStatement(s1);
            ResultSet rs = p.executeQuery();

            while(rs.next()){
                String n = rs.getString("name");
                if(name.equals(n)){
                    oldv = rs.getString("amount");
                    a=1;
                    break;
                }
            }
            
            if(a==1){
                am = am.substring(4, am.length());
                am = am.replaceAll(",", "");

                oldv = oldv.substring(4, oldv.length()-3);
                oldv = oldv.replaceAll(",", "");

                mid = (((100 + Integer.parseInt(discount.substring(0, discount.length()-1))) * Integer.parseInt(am)))/100;

                amt = mid;
                String s2 = "select * from booking";
                PreparedStatement p2 = con.prepareStatement(s2);
                ResultSet rs2 = p2.executeQuery();

                while(rs2.next() && amt!=0){
                    String n = rs2.getString("name");
                    String pro = rs2.getString("product");
                    String ra = rs2.getString("value");
                    String q = rs2.getString("quantity");

                    if(name.equals(n)){
                        if(ra.substring(ra.length()-3, ra.length()).equals(".00")){
                            ra = ra.substring(4, ra.length()-3);
                            ra = ra.replaceAll(",", "");
                        }
                        else{
                            ra = ra.substring(4, ra.length());
                            ra = ra.replaceAll(",", "");
                        }

                        double t = Integer.parseInt(ra) * Integer.parseInt(q);
                        double r = Double.parseDouble(ra);


                        if(t <= amt){
                            String s3 = "delete from booking where name=? and product=?";
                            PreparedStatement p3 = con.prepareStatement(s3);
                            p3.setString(1, name);
                            p3.setString(2, pro);
                            p3.executeUpdate();
                            amt = t - amt;
                        }
                        else if(t > amt){
                            while(amt > 0){
                                if(amt > r){
                                    q = String.valueOf(Integer.parseInt(q)-1);
                                    amt = amt - r;
                                }
                                else{
                                    r = r - amt;
                                    amt=0;
                                }
                            }
                            if(Integer.parseInt(q)>1){
                                q = String.valueOf(Integer.parseInt(q)-1);
                                String rx = "Rs. " + (String)(india.format(r).substring(1));
                                String s3 = "update booking set quantity=? where name=? and product=?";
                                PreparedStatement p3 = con.prepareStatement(s3);
                                p3.setString(1, q);
                                p3.setString(2, name);
                                p3.setString(3, pro);
                                p3.executeUpdate();
                                String s4 = "insert into booking(name, product, value, quantity)" + "values(?,?,?,?)";
                                PreparedStatement p4 = con.prepareStatement(s4);
                                p4.setString(1, name);
                                p4.setString(2, pro);
                                p4.setString(3, rx);
                                p4.setString(4, q);
                                p4.executeUpdate();
                            }
                            else{
                                String rx = "Rs. " + (String)(india.format(r).substring(1));
                                String s3 = "update booking set value=?, quantity=? where name=? and product=?";
                                PreparedStatement p3 = con.prepareStatement(s3);
                                p3.setString(1, rx);
                                p3.setString(2, q);
                                p3.setString(3, name);
                                p3.setString(4, pro);
                                p3.executeUpdate();
                            }
                        }
                    }
                }
            
                total = Integer.parseInt(oldv) - mid;
                
                if(total>0){
                    String r = "Rs. " + (String)(india.format(total).substring(1));
                    
                    String s6 = "update customer set amount=? where name=?";
                    PreparedStatement p6 = con.prepareStatement(s6);
                    p6.setString(1, r);
                    p6.setString(2, name);
                    p6.executeUpdate();
                }
                else{
                    err = "Amount exceeded!";
                }
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
        return ("Rs. " + (String)(india.format(mid).substring(1)));
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
    
    public String err(){
        return err;
    }
    
}

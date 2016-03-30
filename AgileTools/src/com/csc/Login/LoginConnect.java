package com.csc.Login;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginConnect implements Serializable {
	boolean status=false;
	Connection conn=null;
    PreparedStatement pst=null;
    ResultSet rs=null;	
    String JDBC_DRIVER= "com.mysql.jdbc.Driver";
    String DR_URL = "jdbc:mysql://localhost:3306/agiletool";
    String USERNAME = "root";
    String PASSWORD = "rootpassword";
   
    public boolean validate(String name, String pass){
    String query="select * from LoginDetails where UserName=? and LPassword=?";
	try {
		Class.forName(JDBC_DRIVER);
		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
		pst=conn.prepareStatement(query);
		pst.setString(1,name);
		pst.setString(2, pass);
		rs=pst.executeQuery();
		status =rs.next();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally{
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pst!=null){
			try {
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
   return status;
	}
    
    public int register(ArrayList<String> arr){
    	int i=0;
    	System.out.println("I am into");
    	String query="INSERT INTO LoginDetails VALUES(?,?,?,?,?,?,?,?,?,?)";
    	try {
    		Class.forName(JDBC_DRIVER);
    		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
    		pst=conn.prepareStatement(query);
    		pst.setString(1, arr.get(0));
    		pst.setString(2, arr.get(1));
    		pst.setString(3, arr.get(2));
    		pst.setString(4, arr.get(3));
    		pst.setString(5, arr.get(4));
    		pst.setString(6, arr.get(5));
    		pst.setString(7, arr.get(6));
    		pst.setString(8, arr.get(7));
    		pst.setString(9, arr.get(8));
    		pst.setString(10, arr.get(9));
    	    i=pst.executeUpdate();
    	   System.out.println(i);
    	} catch (ClassNotFoundException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	} catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	finally{
    		if(conn!=null){
    			try {
    				conn.close();
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		}
    		if(pst!=null){
    			try {
    				pst.close();
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		}
    		if(rs!=null){
    			try {
    				rs.close();
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		}
    	
    	
    }
    	return i;
}
    public ArrayList<String> determine(String name){
    	ArrayList<String> udetails= new ArrayList<String>();
    	String query="select UserClass, FirstName, ProjectName from LoginDetails where UserName=?";
        String uclass,uname,uproject;
    	try {
    		Class.forName(JDBC_DRIVER);
    		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
    		pst=conn.prepareStatement(query);
    		pst.setString(1,name);
    		rs=pst.executeQuery();
    		udetails.clear();
    		while(rs.next()){
    			uclass=rs.getString("UserClass");      udetails.add(uclass);
    			System.out.println(uclass);
    			uname=rs.getString("FirstName");       udetails.add(uname);
    			System.out.println(uname);
    			uproject=rs.getString("ProjectName");  udetails.add(uproject);
    			System.out.println(uproject);
    		}
    		rs.close();
    	} catch (ClassNotFoundException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	} catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	finally{
    		if(conn!=null){
    			try {
    				conn.close();
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		}
    		if(pst!=null){
    			try {
    				pst.close();
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		}
    		if(rs!=null){
    			try {
    				rs.close();
    			} catch (SQLException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    		}
    	}
    	return udetails;
    }
 public int addTable(String uname){
	 int i=1;
	 String query="Create TABLE " + uname +
                  "(SprintNo INTEGER NOT NULL UNIQUE," +
			      "SprintName VARCHAR(20) NOT NULL UNIQUE," + 
                  "SprintState VARCHAR(20) NOT NULL," + 
			      "Progress VARCHAR(20) NOT NULL," + 
                  "Dates VARCHAR(20) NOT NULL)";
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
			pst=conn.prepareStatement(query);
			i=pst.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pst!=null){
				try {
					pst.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return i;
 }
 public int addSprintDetails(ArrayList<String> sl){
	 int i=0;
 	System.out.println("I am into");
 	String uname=sl.get(5);
 	System.out.println(uname);
 	String query="INSERT INTO " + uname +  " VALUES(?,?,?,?,?)";
 	try {
 		Class.forName(JDBC_DRIVER);
 		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
 		pst=conn.prepareStatement(query);
 		pst.setString(1, sl.get(0));
 		System.out.println(uname);
 		pst.setString(2, sl.get(1));
 		System.out.println(uname);
 		pst.setString(3, sl.get(2));
 		System.out.println(uname);
 		pst.setString(4, sl.get(3));
 		System.out.println(uname);
 		pst.setString(5, sl.get(4));
 		System.out.println(uname);
 	    i=pst.executeUpdate();
 	   System.out.println(i);
 	} catch (ClassNotFoundException e) {
 		// TODO Auto-generated catch block
 		e.printStackTrace();
 	} catch (SQLException e) {
 		// TODO Auto-generated catch block
 		e.printStackTrace();
 	}
 	finally{
 		if(conn!=null){
 			try {
 				conn.close();
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
 		}
 		if(pst!=null){
 			try {
 				pst.close();
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
 		}
 		if(rs!=null){
 			try {
 				rs.close();
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
 		}
 	
 	
 }
 	return i;
	 
 }
}

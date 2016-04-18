package com.csc;
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
    	int i=0,j;
    	int arr_size=arr.size();
    	System.out.println("I am into");
    	String query="INSERT INTO LoginDetails VALUES(?,?,?,?,?,?,?,?,?,?)";
    	try {
    		Class.forName(JDBC_DRIVER);
    		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
    		pst=conn.prepareStatement(query);
    		for(j=0;j<arr_size;j++){
    			pst.setString(j+1,arr.get(j));
    		}
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
    			uname=rs.getString("FirstName");       udetails.add(uname);
    			uproject=rs.getString("ProjectName");  udetails.add(uproject);	
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
	 String query="Create table " + uname +
			      "(SprintName varchar(20) not null unique," +
			      "Description varchar(60) not null," + 
			      "SprintState varchar(20 not null," + 
			      "Progress varchar(20) not null," +
			      "Duration varchar(20) not null)";
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
 public int addSprintDetails(ArrayList<String> sl, String uname){
	 int i=0;
 	String query="INSERT INTO " + uname +  " VALUES(?,?,?,?,?)";
 	try {
 		Class.forName(JDBC_DRIVER);
 		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
 		pst=conn.prepareStatement(query);
 		pst.setString(1, sl.get(0));
 		pst.setString(2, sl.get(1));
 		pst.setString(3, sl.get(2));
 		pst.setString(4, sl.get(3));
 		pst.setString(5, sl.get(4));
 		
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
 public int addProject(ArrayList<String> arr){
 	int i=0,j;
 	int arr_size=arr.size();
 	String query="INSERT INTO Projects VALUES(?,?,?,?,?)";
 	try {
 		Class.forName(JDBC_DRIVER);
 		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
 		pst=conn.prepareStatement(query);
 		for(j=0;j<arr_size;j++){
 			pst.setString(j+1,arr.get(j));
 		}
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
 public int addTasks(ArrayList<String> arr){
	 	int i=0,j;
	 	int arr_size=arr.size();
	 	String query="INSERT INTO Tasks VALUES(?,?,?,?,?,?)";
	 	try {
	 		Class.forName(JDBC_DRIVER);
	 		conn = DriverManager.getConnection(DR_URL, USERNAME, PASSWORD);	
	 		pst=conn.prepareStatement(query);
	 		for(j=0;j<arr_size;j++){
	 			pst.setString(j+1,arr.get(j));
	 		}
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

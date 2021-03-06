package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {

	private static String url = "jdbc:mysql://xiaom.xin:3306/news?user=xiao&password=0420&useUnicode=true&characterEncoding=UTF8&useSSL=false";
	private static String driverName = "com.mysql.jdbc.Driver";

	static {
		try {
			//加载JDBC驱动程序
			Class.forName(driverName);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		try {
			//创建数据库连接
			Connection con = DriverManager.getConnection(url);
			return con;
		} catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	//关闭JDBC对象
	public static void free(Connection con , PreparedStatement ps , ResultSet rs) {
		try {
			if(con != null) {
				con.close();
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) {
						rs.close();
					}
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

}

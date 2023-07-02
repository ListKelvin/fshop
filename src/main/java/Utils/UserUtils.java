/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Connection.DBConnection;
import DTO.CartInfo;
import DTO.UserInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author 03lin
 */
public class UserUtils {
     private static Connection con = null;
    private String query = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;
    
    public static boolean createUser(int account ) {
        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO [user](account)" + "VALUES(?)";
            stm = con.prepareStatement(sql);
            stm.setInt(1, account);
            int row = stm.executeUpdate();
            if (row > 0) {
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return false;
    }
    
    public static UserInfo getUser(int account){
        UserInfo userinfo = null;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [user] WHERE account = ?";
            stm = con.prepareStatement(sql);
            stm.setInt(1, account);
            rs = stm.executeQuery();
             while (rs.next()) {
                userinfo = new UserInfo();
                userinfo.setId(rs.getInt("id"));
                userinfo.setName(rs.getString("name"));
                userinfo.setAvatar(rs.getString("avatar"));
                userinfo.setDob(rs.getDate("dob"));
                userinfo.setGender(rs.getString("gender"));
                userinfo.setPhone(rs.getString("phone"));
                userinfo.setAddress(rs.getString("address"));
                userinfo.setAccount_id(rs.getInt("account"));
}
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return userinfo;
    }
   
    public List<UserInfo> getAllUserInfo() {
        List<UserInfo> users = new ArrayList<>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [user]";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                UserInfo row = new UserInfo();
                row.setId(rs.getInt("id"));
                row.setAccount_id(rs.getInt("account"));
                row.setAddress(rs.getString("address"));
                row.setAvatar(rs.getString("avatar"));
                row.setDob(rs.getDate("dob"));
                row.setGender(rs.getString("gender"));
                row.setName(rs.getString("name"));
                row.setPhone(rs.getString("phone"));

                users.add(row);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return users;
    }

    public UserInfo getUserInfoByAccountId(int AccountId) {
        UserInfo user = null;
        try {
            query = "SELECT * FROM user WHERE account=?";
            stm = this.con.prepareStatement(query);
            stm.setInt(1, AccountId);
            rs = stm.executeQuery();

            while (rs.next()) {
                user = new UserInfo();
                user.setId(rs.getInt("id"));
                user.setAccount_id(rs.getInt("account"));
                user.setAddress(rs.getString("address"));
                user.setAvatar(rs.getString("avatar"));
                user.setDob(rs.getDate("dob"));
                user.setGender(rs.getString("gender"));
                user.setName(rs.getString("name"));
                user.setPhone(rs.getString("phone"));

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return user;
    }

    public UserInfo getUserInfoById(int id) {
        UserInfo user = null;
        try {
            query = "SELECT * FROM user WHERE id=?";
            stm = this.con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();

            while (rs.next()) {
                user = new UserInfo();
                user.setId(rs.getInt("id"));
                user.setAccount_id(rs.getInt("account"));
                user.setAddress(rs.getString("address"));
                user.setAvatar(rs.getString("avatar"));
                user.setDob(rs.getDate("dob"));
                user.setGender(rs.getString("gender"));
                user.setName(rs.getString("name"));
                user.setPhone(rs.getString("phone"));

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return user;
    }

    public List<UserInfo> searchUserInfoByName(String name) {
        List<UserInfo> users = new ArrayList<UserInfo>();
        try {
            query = "SELECT * FROM user WHERE name LIKE ?";
            stm = this.con.prepareStatement(query);
            stm.setString(1, name);
            rs = stm.executeQuery();

            while (rs.next()) {
                UserInfo row = new UserInfo();

                row.setId(rs.getInt("id"));
                row.setAccount_id(rs.getInt("account"));
                row.setAddress(rs.getString("address"));
                row.setAvatar(rs.getString("avatar"));
                row.setDob(rs.getDate("dob"));
                row.setGender(rs.getString("gender"));
                row.setName(rs.getString("name"));
                row.setPhone(rs.getString("phone"));

                users.add(row);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return users;
    }

    public boolean createUserInfo(String name, String avatar, Date dob, String gender, String phone, String address, String account_id) {
        boolean result = false;
        try {
            con = DBConnection.getConnection();
            query = "insert into user(name, avatar, dob, gender, phone, address, account) values (?,?,?,?,?,?,?)";
            stm = con.prepareStatement(query);
            stm.setString(1, name);
            stm.setString(2, avatar);
            stm.setDate(3, dob);
            stm.setString(4, gender);
            stm.setString(5, phone);
            stm.setString(6, address);
            stm.setString(7, account_id);
            stm.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    public boolean updateUserInfo(UserInfo user) {
        boolean result = false;
        try {
            con = DBConnection.getConnection();
            query = "UPDATE user SET name=?, avatar=?,dob=?, gender=?, phone=?, address=?  WHERE account=?;";
            stm = con.prepareStatement(query);
            stm.setString(1, user.getName());
            stm.setString(2, user.getAvatar());
            stm.setDate(3, (Date) user.getDob());
            stm.setString(4, user.getGender());
            stm.setString(5, user.getPhone());
            stm.setString(6, user.getAddress());

            stm.setInt(7, user.getAccount_id());

            stm.executeUpdate();
            result = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }
}

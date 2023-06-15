/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Connection.DBConnection;
import DTO.AccountInfo;
import DTO.CartInfo;
import DTO.ProductInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 03lin
 */
public class ProductUtils {

    private static Connection con = null;
    private String query = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;

    public static List<ProductInfo> getAllProduct() {
        List<ProductInfo> products = new ArrayList<ProductInfo>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [product] where sold_out= 'false' ";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                ProductInfo row = new ProductInfo();
                row.setId(rs.getInt("id"));
                row.setTitle(rs.getString("title"));
                row.setDescription(rs.getString("description"));
                row.setCategoryName(rs.getString("category"));
                row.setPrice(rs.getFloat("price"));
                row.setImage(rs.getString("image"));
                row.setQuantity(rs.getInt("quantity"));
                row.setSold(rs.getInt("sold"));
                row.setSoldOut(rs.getString("sold_out"));
                products.add(row);
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
        return products;
    }

    public List<CartInfo> getCartProducts(ArrayList<CartInfo> cartList) {
        List<CartInfo> products = new ArrayList<CartInfo>();
        try {
            if (cartList.size() > 0) {
                for (CartInfo item : cartList) {
                    query = "SELECT * FROM product WHERE id=?";
                    stm = this.con.prepareStatement(query);
                    stm.setInt(1, item.getId());
                    rs = stm.executeQuery();
                    while (rs.next()) {
                        CartInfo row = new CartInfo();
                        row.setId(rs.getInt("id"));
                        row.setTitle(rs.getString("title"));
                        row.setDescription(rs.getString("description"));
                        row.setCategoryName(rs.getString("category"));
                    row.setPrice(rs.getFloat("price"));
                        row.setImage(rs.getString("image"));
                        row.setSoldOut(rs.getString("sold_out"));
                        row.setSold(rs.getInt("sold"));
                        row.setPrice(rs.getInt("price") * item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        products.add(row);
                    }

                }
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
        return products;
    }
    
    public static List<ProductInfo> searchProduct(String title) {
        List<ProductInfo> products = new ArrayList<ProductInfo>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [product] where title like ? " ;
            stm = con.prepareStatement(sql);
            stm.setString(1,"%" + title + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                ProductInfo row = new ProductInfo();
                row.setId(rs.getInt("id"));
                row.setTitle(rs.getString("title"));
                row.setDescription(rs.getString("description"));
                row.setCategoryName(rs.getString("category"));
                row.setPrice(rs.getFloat("price"));
                row.setImage(rs.getString("image"));
                row.setQuantity(rs.getInt("quantity"));
                row.setSold(rs.getInt("sold"));
                row.setSoldOut(rs.getString("sold_out"));
                products.add(row);
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
        return products;
    }

    public ProductInfo getSingleProduct(int id) {
        ProductInfo product = null;
        try {
            query = "SELECT * FROM product WHERE id=?";
            stm = this.con.prepareStatement(query);
            stm.setInt(1, id);
            rs = stm.executeQuery();

            while (rs.next()) {
                product = new ProductInfo();
                product.setId(rs.getInt("id"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCategoryName(rs.getString("category"));
                product.setPrice(rs.getFloat("price"));
                product.setImage(rs.getString("image"));
                product.setQuantity(rs.getInt("quantity"));
                product.setSold(rs.getInt("sold"));
                product.setSoldOut(rs.getString("sold_out"));

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
        return product;
    }

    public float getTotalCartPrice(ArrayList<CartInfo> cartList) {
        float sum = 0;
        try {
            if (cartList.size() > 0) {
                for (CartInfo item : cartList) {
                    query = "SELECT price FROM product WHERE id=?";
                    stm = this.con.prepareStatement(query);
                    stm.setInt(1, item.getId());
                    rs = stm.executeQuery();

                    while (rs.next()) {
                        sum += rs.getFloat("price") * item.getQuantity();
                    }
                }
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
        return sum;
    }

    public boolean insertProduct(String title, String description, String category, float price, String image, int quantity) {
        boolean result = false;
        try {
            query = "insert into product(title, description, price, category, image, quantity) values (?,?,?,?,?,?)";
            stm = this.con.prepareStatement(query);
            stm.setString(1, title);
            stm.setString(2, description);
            stm.setFloat(3, price);
            stm.setString(4, category);
            stm.setString(5, image);
            stm.setInt(6, quantity);
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

    public boolean updateProduct(int id, String title, String description, String category, float price, String image, int quantity) {
        boolean result = false;
        try {
            query = "UPDATE product SET title=?, description=?,category=?, price=?, image=?, quantity=?  WHERE id=?;";
            stm = this.con.prepareStatement(query);
            stm.setString(1, title);
            stm.setString(2, description);
            stm.setString(3, category);
            stm.setFloat(4, price);
            stm.setString(5, image);
            stm.setInt(6, quantity);
            stm.setInt(7, id);
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

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
import java.math.BigDecimal;
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
    private static String query = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;

    public List<ProductInfo> getAllProduct() {
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

//    public List<CartInfo> getCartProducts(ArrayList<CartInfo> cartList) {
//        List<CartInfo> products = new ArrayList<CartInfo>();
//        try {
//           con = DBConnection.getConnection(); 
//            if (cartList.size() > 0) {
//                for (CartInfo item : cartList) {
//                    query = "SELECT * FROM product WHERE id=?";
//                    stm = this.con.prepareStatement(query);
//                    stm.setInt(1, item.getId());
//                    rs = stm.executeQuery();
//                    while (rs.next()) {
//                        CartInfo row = new CartInfo();
//                        row.setId(rs.getInt("id"));
//                        row.setTitle(rs.getString("title"));
//                        row.setDescription(rs.getString("description"));
//                        row.setCategoryName(rs.getString("category"));
//                    row.setPrice(rs.getFloat("price"));
//                        row.setImage(rs.getString("image"));
//                        row.setSoldOut(rs.getString("sold_out"));
//                        row.setSold(rs.getInt("sold"));
//                        row.setPrice(rs.getInt("price") * item.getQuantity());
//                        row.setQuantity(item.getQuantity());
//                        products.add(row);
//                    }
//
//                }
//            }
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        } finally {
//            try {
//                if (rs != null) {
//                    rs.close();
//                }
//                if (stm != null) {
//                    stm.close();
//                }
//                if (con != null) {
//                    con.close();
//                }
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
//        return products;
//    }
    public static List<ProductInfo> searchProduct(String title) {
        List<ProductInfo> products = new ArrayList<ProductInfo>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [product] where sold_out= 'false' and title like ? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + title + "%");
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

    public static List<ProductInfo> searchProductCategory(String cate) {
        List<ProductInfo> products = new ArrayList<ProductInfo>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [product] where sold_out= 'false' and category =? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, cate);
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

    public static List<ProductInfo> getProductByCategory(String cate, String search) {
        List<ProductInfo> products = new ArrayList<ProductInfo>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM [product] where sold_out= 'false' and category=? and title like ? ";
            stm = con.prepareStatement(sql);
            stm.setString(1, cate);
            stm.setString(2, "%" + search + "%");
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

    public static ProductInfo getSingleProduct(int id) {
        ProductInfo product = null;
        try {
            con = DBConnection.getConnection();
            query = "SELECT * FROM product WHERE id=?";
            stm = con.prepareStatement(query);
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

    public static float getTotalCartPrice(List<CartInfo> cartList) {
        float sum = 0;
        try {
            con = DBConnection.getConnection();
            if (cartList.size() > 0) {
                for (CartInfo item : cartList) {
                    query = "SELECT price FROM product WHERE id=?";
                    stm = con.prepareStatement(query);
                    stm.setInt(1, item.getId());
                    rs = stm.executeQuery();

                    while (rs.next()) {
                        sum += rs.getFloat("price") * item.getCartQuantity();
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

    public boolean insertProduct(ProductInfo product) {
        boolean result = false;
        try {
            con = DBConnection.getConnection();
            query = "insert into product(title, description, price, category, image, quantity) values (?,?,?,?,?,?)";
            stm = con.prepareStatement(query);
            stm.setString(1, product.getTitle());
            stm.setString(2, product.getDescription());
            stm.setFloat(3, product.getPrice());
            stm.setString(4, product.getCategoryName().toLowerCase());
            stm.setString(5, product.getImage());
            stm.setInt(6, product.getQuantity());
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

    public boolean updateProduct(ProductInfo product) {
        boolean result = false;
        try {
            con = DBConnection.getConnection();
            query = "UPDATE product SET title=?, description=?,category=?, price=?, image=?, quantity=?, sold_out=?  WHERE id=?;";
            stm = con.prepareStatement(query);
            stm.setString(1, product.getTitle());
            stm.setString(2, product.getDescription());
            stm.setString(3, product.getCategoryName().toLowerCase());
            stm.setFloat(4, product.getPrice());
            stm.setString(5, product.getImage());
            stm.setInt(6, product.getQuantity());
            stm.setString(7, product.getSoldOut());
            stm.setInt(8, product.getId());
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

    public boolean updateProductSold(ProductInfo product) {
        boolean result = false;
        try {
            con = DBConnection.getConnection();
            query = "UPDATE product SET quantity=?, sold=?, sold_out=? WHERE id=?;";
            stm = con.prepareStatement(query);
            stm.setInt(1, product.getQuantity());
            stm.setInt(2, product.getSold());
            stm.setString(3, product.getSoldOut());
            stm.setInt(4, product.getId());
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

    public static int countProduct() {
        int count = 0;
        try {
            con = DBConnection.getConnection();
            query = "  SELECT COUNT( DISTINCT [id]) AS count_product FROM [product] WHERE sold_out = 'false' ";
            stm = con.prepareStatement(query);
            rs = stm.executeQuery();
            while (rs.next()) {
                count = rs.getInt("count_product");
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
        return count;
    }

    public static List<ProductInfo> getBestSeller() {
        List<ProductInfo> products = new ArrayList<ProductInfo>();
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT TOP 10  * FROM [product] WHERE sold_out='false' ORDER BY sold DESC ";
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
            System.out.println(ex.getMessage());

        } catch (Exception ex) {
            System.out.println(ex.getMessage());

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
                System.out.println(ex.getMessage());
            }
        }
        return products;
    }

}

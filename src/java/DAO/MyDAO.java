/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Administrator
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Comments;
import models.Posts;
import models.Topics;
import models.Users;

public class MyDAO extends DBContext {

    public Users getUser(String username, String password) {
        String sql = "select * from Users where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5));
                return u;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void signup(String user, String email, String pass) {
        String sql = "INSERT INTO Users (username, email, password, role, isBan, isEnable) VALUES (?, ?, ?, 0, 0, 0)";

        try {
            // Check if the user already exists
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Users getUserByUsername(String username) {
        // Define SQL query
        String query = "SELECT * FROM Users WHERE username =?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Users(rs.getString("username"), rs.getString("email"), rs.getString("password"), rs.getInt("role"), rs.getBoolean("isBan"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Posts> getPost() {
        List<Posts> list = new ArrayList<>();
        String sql = "select * from Posts p join Users u on p.name=u.username";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Posts p = new Posts(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Comments> getComment() {
        List<Comments> list = new ArrayList<>();
        String sql = "select * from Comments";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comments c = new Comments(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Topics> getTopic() {
        List<Topics> list = new ArrayList<>();
        String sql = "select * from Topics";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Topics t = new Topics(rs.getInt(1), rs.getString(2));
                list.add(t);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int createPost(int topicID, String title, String content, Timestamp createdAt, String name) {
        String sql = "INSERT INTO [dbo].[Posts] ([topicID], [title], [content], [createdAt], [name]) VALUES (?,?,?,?,?)";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, topicID);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setTimestamp(4, createdAt);
            ps.setString(5, name);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                return 1;
            } else {
                return -1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public int addTopic(Topics t) {
        String sql = "INSERT INTO [dbo].[Topics] (tag) VALUES (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getTag());
            ps.execute();

        } catch (Exception e) {
            e.printStackTrace(); // Thường thì nên in ra lỗi để biết lý do khi xảy ra lỗi.
        }
        return -1;
    }

    public int getTopicIDByTag(String tag) {
        String sql = "SELECT [topicID] FROM [Forum_BL5].[dbo].[Topics] WHERE [tag] = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, tag);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("topicID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;
    }

    public String getEmail(String userEmail) throws SQLException {
        String sql = "SELECT email FROM Users WHERE email = ?";
        PreparedStatement st = null;
        ResultSet rs = null;
        String email = null;
        try {
            st = connection.prepareStatement(sql);
            st.setString(1, userEmail);
            rs = st.executeQuery();
            if (rs.next()) {
                email = rs.getString("email");
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
        }
        return email;
    }

    public List<Users> getUsernameByEmail(String email) {
        List<Users> list = new ArrayList<>();

        String sql = "select username, password from Users where email=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Posts> getPostByPage(List<Posts> post, int start, int end) {
        ArrayList<Posts> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(post.get(i));
        }
        return arr;
    }

    public Posts getPostById(String id) {
        try {
            String sql = "select * from Posts " + "where PostID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Posts(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Comments> getCommentsByPostId(String postId) {
        List<Comments> comments = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Comments WHERE PostID=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, postId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Comments comment = new Comments(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                comments.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }

    public void leaveComment(String id, String name, String comment) {
        String sql = "insert into Comment ([postID], [content], [name]) set value (?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, comment);
            ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Users> getUserAll() {
        ArrayList<Users> list = new ArrayList<Users>();
        String sql = "select * from Users";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users u = new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5));
                list.add(u);

            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void editUser(Users u, String name, String password, String email) {
        try {
            String sql = "UPDATE [dbo].[Users] SET [email] = ?, [password] = ? WHERE username= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.executeUpdate(); // Change execute() to executeUpdate()
        } catch (SQLException ex) {
            Logger.getLogger(MyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUser(String name) {
        try {
            String sql = "DELETE FROM Users where username=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.execute();
        } catch (SQLException e) {
            System.out.println("Error deleting username: " + e.getMessage());
        }
    }

}

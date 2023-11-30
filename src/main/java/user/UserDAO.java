package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DatabaseUtil;

public class UserDAO {

    public int join(String userID, String userPW, String userEmail, String gender) {
        String SQL = "INSERT INTO users (userID, userPW, userEmail, gender) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {

            pstmt.setString(1, userID);
            pstmt.setString(2, userPW);
            pstmt.setString(3, userEmail);
            pstmt.setString(4, gender);

            System.out.println("SQL Query: " + pstmt.toString());

            int rowsAffected = pstmt.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }
}


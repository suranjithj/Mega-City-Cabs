package dao;

import models.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;
import static org.mockito.Mockito.when;

class UserDAOTest {
    @InjectMocks
    private UserDAO userDAO;

    @Mock
    private Connection mockConnection;

    @Mock
    private PreparedStatement mockPreparedStatement;

    @Mock
    private ResultSet mockResultSet;

    @BeforeEach
    void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
    }

    @Test
    void testRegisterUser_Success() throws SQLException {
        User user = new User();
        user.setUsername("testUser");
        user.setName("John Doe");
        user.setAddress("123 Street");
        user.setPhone("1234567890");
        user.setNic("987654321V");
        user.setEmail("test@example.com");
        user.setPassword("password123");

        when(mockPreparedStatement.executeUpdate()).thenReturn(1);

        boolean result = userDAO.registerUser(user);
        assertTrue(result, "User should be registered successfully.");
    }

    @Test
    void testRegisterUser_Failure() throws SQLException {
        User user = new User();
        user.setUsername("testUser");

        when(mockPreparedStatement.executeUpdate()).thenReturn(0);

        boolean result = userDAO.registerUser(user);
        assertFalse(result, "User registration should fail.");
    }

    @Test
    void testValidateUser_Success() throws SQLException {
        String username = "testUser";
        String password = "password123";

        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(true);
        when(mockResultSet.getString("username")).thenReturn(username);
        when(mockResultSet.getString("password")).thenReturn(password);

        User result = userDAO.validateUser(username, password);
        assertNotNull(result, "User should be validated successfully.");
        assertEquals(username, result.getUsername());
    }

    @Test
    void testValidateUser_Failure() throws SQLException {
        String username = "testUser";
        String password = "testUser";

        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);
        when(mockResultSet.next()).thenReturn(false);

        User result = userDAO.validateUser(username, password);
        assertNull(result, "User validation should fail with incorrect credentials.");
    }

}
package controllers;

import config.connectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // Max file size: 10MB
        maxRequestSize = 1024 * 1024 * 50    // Max request size: 50MB
)
public class UpdateImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); //Data Extraction
        Part filePart = request.getPart("imageFile"); //File Handling

        String uploadPath = getServletContext().getRealPath("/") + "images/cabs/";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); //Directory Creation
        }

        String existingImage = "images/cabs/no-image.png";
        try (Connection con = connectionProvider.getConnection()) {
            PreparedStatement psSelect = con.prepareStatement("SELECT image FROM cars WHERE id = ?");
            psSelect.setInt(1, id);
            ResultSet rs = psSelect.executeQuery();
            if (rs.next() && rs.getString("image") != null) {
                existingImage = rs.getString("image"); //Database Interaction
            }
        } catch (Exception e) {
            e.printStackTrace(); //Exception Handling
        }

        String filePath = existingImage;
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            filePath = "images/cabs/" + fileName;
            filePart.write(uploadPath + fileName); //File Writing
        }

        try (Connection con = connectionProvider.getConnection()) {
            PreparedStatement psUpdate = con.prepareStatement("UPDATE cars SET image = ? WHERE id = ?");
            psUpdate.setString(1, filePath); //Database Interaction
            psUpdate.setInt(2, id);
            psUpdate.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); //Exception Handling
        }

        //Request Forwarding
        request.setAttribute("msg", "Image updated successfully");
        request.getRequestDispatcher("interfaces/admin/manage-car/updateimage.jsp?id=" + id).forward(request, response);

    }
}

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
                                //Inheritance
public class UpdateImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Part filePart = request.getPart("imageFile");

        String uploadPath = getServletContext().getRealPath("/") + "images/cabs/";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String existingImage = "images/cabs/no-image.png";
        try (Connection con = connectionProvider.getConnection()) {
            PreparedStatement psSelect = con.prepareStatement("SELECT image FROM cars WHERE id = ?");
            psSelect.setInt(1, id);
            ResultSet rs = psSelect.executeQuery();
            if (rs.next() && rs.getString("image") != null) {
                existingImage = rs.getString("image");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String filePath = existingImage;
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            filePath = "images/cabs/" + fileName;
            filePart.write(uploadPath + fileName);
        }

        try (Connection con = connectionProvider.getConnection()) {
            PreparedStatement psUpdate = con.prepareStatement("UPDATE cars SET image = ? WHERE id = ?");
            psUpdate.setString(1, filePath);
            psUpdate.setInt(2, id);
            psUpdate.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("msg", "Image updated successfully");
        request.getRequestDispatcher("interfaces/admin/manage-car/updateimage.jsp?id=" + id).forward(request, response);

    }
}

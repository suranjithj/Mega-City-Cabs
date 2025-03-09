package services;

import com.mailjet.client.ClientOptions;
import com.mailjet.client.MailjetClient;
import com.mailjet.client.MailjetRequest;
import com.mailjet.client.MailjetResponse;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.resource.Emailv31;
import org.json.JSONArray;
import org.json.JSONObject;

public class EmailService {
    private static final String API_KEY = "851a95a85f763c24533b403853e1d565";
    private static final String SECRET_KEY = "83ac5c33e919cd605b9710d66a187ba3";

    public static void sendEmail(String recipientEmail, String recipientName, String subject, String messageBody) {
        try {
            MailjetClient client = new MailjetClient(
                    ClientOptions.builder()
                            .apiKey(API_KEY)
                            .apiSecretKey(SECRET_KEY)
                            .build()
            );

            MailjetRequest request = new MailjetRequest(Emailv31.resource)
                    .property(Emailv31.MESSAGES, new JSONArray()
                            .put(new JSONObject()
                                    .put(Emailv31.Message.FROM, new JSONObject()
                                            .put("Email", "huninsta0@gmail.com")
                                            .put("Name", "Mega City Cab"))
                                    .put(Emailv31.Message.TO, new JSONArray()
                                            .put(new JSONObject()
                                                    .put("Email", recipientEmail)
                                                    .put("Name", recipientName)))
                                    .put(Emailv31.Message.SUBJECT, subject)
                                    .put(Emailv31.Message.TEXTPART, messageBody)
                                    .put(Emailv31.Message.HTMLPART, "<h3>" + messageBody + "</h3>")));

            MailjetResponse response = client.post(request);

            if (response.getStatus() == 200) {
                System.out.println("Email sent successfully!");
            } else {
                System.out.println("Failed to send email: " + response.getData());
            }
        } catch (MailjetException e) {
            e.printStackTrace();
        }
    }

    public static void sendBookingConfirmation(String customerEmail, String customerName, String pickupLocation, String destination, String carNo) {
        try {
            MailjetClient client = new MailjetClient(
                    ClientOptions.builder()
                            .apiKey(API_KEY)
                            .apiSecretKey(SECRET_KEY)
                            .build()
            );

            MailjetRequest request = new MailjetRequest(Emailv31.resource)
                    .property(Emailv31.MESSAGES, new JSONArray()
                            .put(new JSONObject()
                                    .put(Emailv31.Message.FROM, new JSONObject()
                                            .put("Email", "huninsta0@gmail.com")
                                            .put("Name", "Mega City Cab"))
                                    .put(Emailv31.Message.TO, new JSONArray()
                                            .put(new JSONObject()
                                                    .put("Email", customerEmail)
                                                    .put("Name", customerName)))
                                    .put(Emailv31.Message.SUBJECT, "Booking Confirmation - Mega City Cab")
                                    .put(Emailv31.Message.TEXTPART, "Dear " + customerName + ",\n\nYour booking has been confirmed.\n\nPickup Location: " + pickupLocation + "\nDestination: " + destination + "\nCar Number: " + carNo + "\n\nThank you for choosing Mega City Cab!")
                                    .put(Emailv31.Message.HTMLPART, "<h3>Dear " + customerName + ",</h3><p>Your booking has been confirmed.</p><p><b>Pickup Location:</b> " + pickupLocation + "</p><p><b>Destination:</b> " + destination + "</p><p><b>Car Number:</b> " + carNo + "</p><p>Thank you for choosing Mega City Cab!</p>")));

            MailjetResponse response = client.post(request);

            if (response.getStatus() == 200) {
                System.out.println("Booking confirmation email sent successfully!");
            } else {
                System.out.println("Failed to send booking confirmation email: " + response.getData());
            }
        } catch (MailjetException e) {
            e.printStackTrace();
        }
    }
}

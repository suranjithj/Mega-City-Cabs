package services;

import com.mailjet.client.ClientOptions;
import com.mailjet.client.MailjetClient;
import com.mailjet.client.MailjetRequest;
import com.mailjet.client.MailjetResponse;
import com.mailjet.client.resource.Emailv31;
import org.json.JSONArray;
import org.json.JSONObject;

public class EmailService {
    private static final String API_KEY = "f1272bd02fb871d7dfe739a4076899f9";
    private static final String SECRET_KEY = "99a3ae2dd110e73107925aeadc9fe7bb";

    public static void sendEmail(String recipientEmail, String recipientName, String subject, String messageBody) {
        try {

            MailjetClient client = new MailjetClient(
                    ClientOptions.builder()
                            .apiKey(API_KEY)
                            .apiSecretKey(SECRET_KEY)
                            .build()
            );
            MailjetRequest request;
            MailjetResponse response;

            request = new MailjetRequest(Emailv31.resource)
                    .property(Emailv31.MESSAGES, new JSONArray()
                            .put(new JSONObject()
                                    .put(Emailv31.Message.FROM, new JSONObject()
                                            .put("Email", "suranjith9911@gmail.com")
                                            .put("Name", "Mega City Cab"))
                                    .put(Emailv31.Message.TO, new JSONArray()
                                            .put(new JSONObject()
                                                    .put("Email", recipientEmail)
                                                    .put("Name", recipientName)))
                                    .put(Emailv31.Message.SUBJECT, subject)
                                    .put(Emailv31.Message.TEXTPART, messageBody)
                                    .put(Emailv31.Message.HTMLPART, "<h3>" + messageBody + "</h3>")));

            response = client.post(request);

            if (response.getStatus() == 200) {
                System.out.println("Email sent successfully!");
            } else {
                System.out.println("Failed to send email: " + response.getData());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


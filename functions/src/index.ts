import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

export const sendNotification = functions.https.onCall(
  async (request, context) => {
    const { title, body, token } = request.data as {
      title: string;
      body: string;
      token: string;
    };

    const message = {
      notification: {
        title,
        body,
      },
      token,
    };

      try {
    const response = await admin.messaging().send(message);
    console.log("Notification sent:", response);
    return { success: true, response };
  } catch (error) {
    console.error("Error sending notification:", error);
    throw new functions.https.HttpsError("unknown", "Notification failed", error);
  }
  }
);

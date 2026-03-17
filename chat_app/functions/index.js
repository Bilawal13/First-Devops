const functions = require("firebase-functions/v2/firestore");
const admin = require("firebase-admin");

// When encountering an error after using this code
// follow the link that should be shown in the error message
// Enable the registry (on the page after following the link) and try again

admin.initializeApp();
exports.myFunction = functions.onDocumentCreated(
    "chat/{messageId}",
    (event) => {
        const data = event.data.data();
        return admin.messaging().send({
            notification: {
                title: data["username"],
                body: data["text"],
            },
            data: {
                click_action: "FLUTTER_NOTIFICATION_CLICK",
            },
            topic: "chat",
        });
    }
);

//explain the above code in detail
// The above code is a Cloud Function that listens for new documents created in the "chat" collection in Firestore. When a new document is created, it triggers the function and sends a push notification to all devices subscribed to the "chat" topic. The notification contains the username and text of the message that was just created. The click_action in the data payload is used to handle the notification click event in the Flutter app, allowing you to navigate to a specific screen when the user taps on the notification.
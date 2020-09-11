import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';


// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });


export const PrivacyPolicy = functions.https.onRequest((request, response) => {
    const spawn = require('child-process-promise').spawn;
    const path = require('path');
    const os = require('os');
    const filesystem = require('fs');
    const storage = admin.storage();
    


})
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const request = require("graphql-request");

const client = new request.GraphQLClient('<https://trusted-eft-22.hasura.app/v1/graphql>', {
    headers: {
        "content-type": "application/json",
        "x-hasura-admin-secret": "<w7oQ6tEr062bFK5OZEPi2fIjOxQ4fdfDwB1hCXmxL0LFqAgYnvpOkcFCjT0WViyr>" 
    }
});

admin.initializeApp(functions.config().firebase);
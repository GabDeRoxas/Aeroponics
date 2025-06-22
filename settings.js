module.exports = {
  uiPort: process.env.PORT || 1880,

  disableEditor: true, // 🔐 THIS hides the editor

  credentialSecret: process.env.NODE_RED_CREDENTIAL_SECRET || "secret123",

  httpStatic: '/data', // still allows serving static content like /ui
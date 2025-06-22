module.exports = {
  uiPort: process.env.PORT || 1880,

  // Disable the editor UI
  disableEditor: true,

  // Secret used to encrypt credentials (can match your Render env var)
  credentialSecret: process.env.NODE_RED_CREDENTIAL_SECRET || "secret123",

  // Serve static files and allow dashboard access
  httpStatic: '/data',

  // Redirect / to /ui
  httpMiddleware: {
    '/' : function(req, res, next) {
      if (req.url === '/') {
        res.writeHead(302, { 'Location': '/ui' });
        res.end();
      } else {
        next();
      }
    }
  }
};

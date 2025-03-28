module.exports = {
  apps: [{
    name: 'express-app',
    script: 'bin/www',
    instances: 1,
    autorestart: true,
    watch: true,
    max_memory_restart: '1G',
    env: {
      NODE_ENV: 'development'
    }
  }]
}
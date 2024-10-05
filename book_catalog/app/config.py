import os

DATABASE_URL = os.getenv('DATABASE_URL', 'postgresql://user:password@host:port/dbname')

# Add a hardcoded secret
SECRET_KEY = "mysecretkey"  # Hardcoded secret key v

# Retrieve the secret key from the environment
#SECRET_KEY = os.getenv("SECRET_KEY", "fallbacksecret")

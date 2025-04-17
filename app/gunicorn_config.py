
workers = 2

threads = 2

bind = '0.0.0.0:8080'

forwarded_allow_ips = '*'

secure_scheme_headers = { 'X-Forwarded-Proto': 'https' }
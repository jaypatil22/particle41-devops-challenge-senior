from flask import Flask, request
from datetime import datetime

app = Flask(__name__)

@app.route("/", methods=["GET"])
def home():
    current_time = datetime.now()
    visitor_ip = request.headers.get('X-Forwarded-For', request.remote_addr)
    return {
        "timestamp": current_time,
        "ip": visitor_ip
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)

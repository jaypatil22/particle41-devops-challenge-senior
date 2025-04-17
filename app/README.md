# SimpleTimeService

A tiny Python-based microservice that returns the current UTC timestamp and the client's IP address as a JSON response.

## 🔧 Features

- Returns current UTC timestamp in ISO8601 format
- Returns requester's IP address
- Built using Flask
- Uses Gunicorn WSGI

## 🛠️ Prerequisites

- Docker


## 🐳 How to Use

### 1. Clone the repo

```bash
git clone https://github.com/jaypatil22/particle41-devops-challenge-senior.git
cd particle41-devops-challenge-senior/app
```

### 2. Build the Container

```bash
docker build -t <name-of-the-image:tag> .
```
### 3. Run the Container

```bash
docker run -p <host-port>:8080 <name-of-the-image:tag>
```
### 4. Access the application
Open below URL 
```bash 
http://127.0.0.1:<host-port>/
```
---

### The image can also be downloaded from docker hub
```bash
docker pull vijaypatil22/particle41-devops-challenge-senior:latest
```
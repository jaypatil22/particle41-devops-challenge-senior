# Use minimal base image
FROM python:3.13-alpine

# Set environment variables to prevent Python from writing pyc files and buffering output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create a non-root user
RUN addgroup --system appgroup && adduser --system --ingroup appgroup appuser

# Create and set working directory
WORKDIR /home/appuser/app

# Copy dependency files and install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .
COPY gunicorn_config.py .

# Set permissions and switch to non-root user
RUN chown -R appuser:appgroup /home/appuser
USER appuser

# Expose port 8080 and start the app
EXPOSE 8080
CMD ["gunicorn","--config", "gunicorn_config.py", "app:app"]

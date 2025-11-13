# Use python base image
FROM python:3.11-slim

# Set workdir
WORKDIR /app

# Copy app code
COPY app/ /app

# Install dependencies and curl (used by docker-compose healthcheck)
RUN apt-get update \
	&& apt-get install -y --no-install-recommends curl \
	&& rm -rf /var/lib/apt/lists/* \
	&& pip install --no-cache-dir flask

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]

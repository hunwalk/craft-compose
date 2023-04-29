#!/bin/bash

# Copy the .env.example.dev file to .env
cp .env.example.dev .env

# Prompt the user for the Craft App ID
read -p "Enter the Craft App ID: " craft_app_id

# Generate a random 32-character string for the Craft Security Key
craft_security_key=$(openssl rand -hex 16)

# Set the required keys in the .env file
sed -i "s/CRAFT_APP_ID=.*/CRAFT_APP_ID=$craft_app_id/" .env
sed -i "s/CRAFT_SECURITY_KEY=.*/CRAFT_SECURITY_KEY=$craft_security_key/" .env
sed -i "s/CRAFT_DB_PASSWORD=.*/CRAFT_DB_PASSWORD=root/" .env
sed -i "s/CRAFT_DB_DATABASE=.*/CRAFT_DB_DATABASE=craft/" .env

# Run docker-compose up in detached mode
docker compose up -d
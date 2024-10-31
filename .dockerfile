FROM node:18-alpine

# Install necessary dependencies
RUN apk add --no-cache git

WORKDIR /app

# Copy package files first
COPY package*.json ./

# Clear npm cache and install dependencies
RUN npm cache clean --force
RUN npm install

# Copy the rest of the project
COPY . .

# Build the project
RUN npm run build

# Expose port
EXPOSE 5000


CMD ["npm", "start"]
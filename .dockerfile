# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install ALL dependencies (including devDependencies)
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the application (this will run tsc)
RUN npm run build

# Remove devDependencies
RUN npm prune --production

# Expose the port your app runs on (adjust if necessary)
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
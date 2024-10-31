# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Install a specific version of npm globally
RUN npm install -g npm@8.19.2

# Clean npm cache
RUN npm cache clean --force

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Remove devDependencies
RUN npm prune --production

# Expose the port your app runs on (adjust if necessary)
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
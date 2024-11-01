# 1. Choose a base image with Node 16 or 18
FROM node:16

# 2. Set the working directory in the container
WORKDIR /app

# 3. Copy only package.json and package-lock.json first (for caching purposes)
COPY package*.json ./

# 4. Install project dependencies, using --legacy-peer-deps to bypass conflicts
RUN npm install --legacy-peer-deps

# 5. Copy the rest of the project files into the container
COPY . .

# 6. Build the project for production
RUN npm run build

# 7. Install a simple HTTP server to serve the static files
RUN npm install -g http-server

# 8. Specify the command to run the server and serve the built site
CMD ["http-server", "public"]

# Dockerfile
# Chọn image node chính thức
FROM node:14

# Tạo thư mục làm việc trong container
WORKDIR /app

# Sao chép package.json vào container và cài đặt dependencies
COPY package*.json ./
RUN npm install

# Sao chép toàn bộ mã nguồn vào container
COPY . .

# Expose cổng server
EXPOSE 3000

# Khởi chạy server
CMD ["node", "server.js"]

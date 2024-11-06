# Dockerfile
# Sử dụng một image chính thức có Terraform và AWS CLI
FROM hashicorp/terraform:latest

# Cài đặt AWS CLI
RUN apk add --no-cache python3 py3-pip && \
    pip install awscli

# Sao chép mã nguồn vào container
WORKDIR /app
COPY . .

# Thiết lập các quyền cần thiết nếu có
RUN chmod +x deploy.sh # nếu bạn có script deploy.sh

# Khai báo biến môi trường AWS (người dùng sẽ cần cung cấp trước khi chạy container)
ENV AWS_ACCESS_KEY_ID=<Your_Access_Key>
ENV AWS_SECRET_ACCESS_KEY=<Your_Secret_Key>
ENV AWS_DEFAULT_REGION=us-west-1

# Lệnh chạy khi container khởi động (nếu bạn có script để chạy Terraform)
CMD ["./deploy.sh"]

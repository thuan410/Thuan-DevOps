variable "create_user" {
  description = "Bạn có muốn tạo IAM user không ?"
  type = bool
  # khi không nhập tên thì nó sẽ tự tạo một giá trị mặc định
  default = true
}

variable "name" {
  description = "Tên mong muốn cho IAM"
  type = string
}

variable "tags" {
  description = "đặt tên"
  type = map(string)
  default = { }
}

# tạo key để có thể kết nối với AWS
variable "create_iam_access_key" {
  description = "Bạn có muốn tạo khóa IAM không?"
  type = bool
  default = true
}

variable "pgp_key" {
  description = "value"
  type = string
  default = ""
}

# Kiểm tra trạng thái
variable "iam_access_key_status" {
  description = "Access key status to apply"
  type = string
  default = null
}

# thêm quyền cho các user 
variable "policy_arns" {
  description = "danh sach ARNS cua chinh sach den voi IAM user"
  type = list(string)
  default = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ]
  
}


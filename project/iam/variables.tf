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
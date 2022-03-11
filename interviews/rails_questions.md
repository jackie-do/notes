Câu hỏi chung:
**Ruby**
- `require` và `load` khác nhau thế nào trong Ruby?
> `require` sẽ đọc và load file được gọi một lần duy nhất. Ở những lần sau nó sẽ kiểm trả lại file đã được gọi chưa là lấy kết quả của lần gọi trước được lưu trong bộ nhớ nếu có.
> `load` sẽ đọc và load file được gọi mỗi khi file đó được chạy

- class methods là gì? instance methods là gì?

- Trong ruby có hỗ trợ đa kế thừa không? Mixin là gì ?
> Trong Ruby không hỗ trợ đa kế thừa. Mixin về cơ bản chỉ là việc đưa các module code vào 1 class nào đó để class đó có quyền sử dụng các method được định nghĩa trong module. Việc tận dụng Mixin cũng có thể thay thế một phần cho việc đa kế thừa.

- `include`, `extend`, `prepend` khác nhau thế nào trong Ruby?
> Khi một module được mixin vào trong một class, ta có một số lựa chọn để định nghĩa cách mà các methods trong module được gọi trong class.
> `include` - các instance methods trong module sẽ được sử dụng như các instance methods trong class đó.nếu trong class đc include có method trùng tên thì nó sẽ gọi method ở class đó  
> `extend` - các instance methods trong module sẽ được sử dụng như các class methods trong class
> `prepend` - về cơ bản là y hệt như include nhưng ancestors chain thay đổi khác một chút. nhưng nếu trong class đc prepend có method trùng tên thì nó sẽ gọi method ở module 

- `block`, `proc` và `lambda` là gì? Khác biệt chính giữa `proc` và `lambda`?
- Sự khác biệt giữa `select` và `detect` khi sử dụng trong một Array?
- Cách gọi một method với bằng string, với string là tên method. Cách gọi một method bằng string với parameters ?
- Công dụng của `attr_reader`, `attr_writter`, `attr_accessor`
- Một class con kế thừa từ một class cha thì method `super` dùng để làm gì?


**Rails**
- Sự khác nhau giữa `find` và `find_by` ? Làm các nào để sử dụng `find_by` đem lại kết của giống như `find`
- Sự khác nhau giữa `includes` và `eager_load`. Ưu điểm của mỗi cái 
- Có những loại sessions nào trong Rails? Cookie-Session hoạt động như thế nào?
- ORM là gì? Gem nào phổ biết nhất trong Rails cho ORM?
- Cách sử dụng Polymorphic Association trong Rails?
- Cách sử dụng STI (Single Table Inheritance) trong Rails như thế nào?

### Senior level:
**Ruby**
- Kể tên một vài Coding Pattern bạn hay sử dụng?
- Trong ruby có thể lập trình meta programming, ta dùng hay dùng nhưng cách nào, method nào cho việc lập trình meta programming.
- Khi gọi method trong một Ruby class, cách Ruby tìm ra method này thế nào? Khi nào sẽ raise exception (no methods)?
- Giải thích về cách thức hoạt động của Thread trong Ruby? Trong ruby ta có thể lập trình parallel hay concurrent ? Dùng như thế nào.

**Rails**
- Khác biệt của code trong thư muc `app/services` và thư mục `lib` là gì?
- Khi có một request tới server và được xử lý bởi controller, thì controller đó sẽ init một instance của chính nó để xử lý hay là xử lý bằng chính class đó?
- Cách hoạt động của Authentication Token trong một Form ở Rails?
- Giả sử ta có một model User với data hơn 1 triệu dòng, ta có nên dùng đoạn code bên dưới để đọc tuần tự data tất cả users hay không? Có vấn đề gì xảy ra không?
```ruby
User.all.each do |u|
	# your logic
end
```
- Có các loại joins nào trong Postgresql? Cú pháp joins default của ActiveRecord là gì? Cú pháp outer join của ActiveRecord là gì?  
(INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN , SELF JOIN)
- Để viết các câu SQL phức tạp mà ActiveRecord không support đủ thì ngoại trừ viết string query thì còn có những gem nào hỗ trợ không?
- Khác biệt giữa TRUNCATE và DELETE ALL trong database là gì?
- Tính hiệu quả khi đánh index trên columns. Giả sử ta có table `peoples` với column `id`, `name`, `email` nếu ta đánh index trên column `name` thì những cú pháp nào sẽ tận dụng đc index 
```SQL
; case 1
SELECT id, email
FROM people
WHERE name LIKE ''
```
- Một bài toán Design Database

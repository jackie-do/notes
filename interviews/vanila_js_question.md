## Bộ câu hỏi phỏng vấn JS thuần 
### I) Các câu hỏi lý thuyết:
##### 1) Hoisting trong JS là gì ?
##### 2) Kết quả của đoạn code bên dưới là gì? 

```js
function sayHi() {
  console.log(name);
  console.log(age);
  var name = "Lydia";
  let age = 21;
}

sayHi();
```

**Đáp án**

log ra được `undefined` cho biến name 
và raise `ReferenceError` cho biến age 

> Đối với biến `name` được khai báo bằng keyword var, khi code được load (đã xảy ra hoisting) biến `name` đã được *định nghĩa* nhưng chưa được *gán* giá trị nên khi log ra sẽ hiển thị là **undefined**
> Đối với biến `age` được khai báo bằng keyword let, đối với những biến được khai báo bằng let thì chúng ra chỉ có thể truy cập sau khi biến đó được gán giá trị thật sự.

câu hỏi phụ: khi nào declaration diễn ra, khi nào việc assignment diễn ra 


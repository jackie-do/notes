## Bộ câu hỏi phỏng vấn JS thuần 
### I) Các câu hỏi lý thuyết:
1) Hoisting trong JS là gì ?
2) Kết quả của đoạn code bên dưới là gì? 

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
> Đối với biến `name` được khai báo bằng var, khi code được load biến var đã được **
>
câu hỏi phụ: khi nào declaration diễn ra, khi nào việc assignment diễn ra 


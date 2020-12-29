## Bộ câu hỏi phỏng vấn JS thuần 
### I) Các câu hỏi lý thuyết:
##### 1) Hoisting trong JS là gì ?
*Đáp án*

Hoisting là cơ chế của JavaScript cho phép các khai báo biến hoặc hàm được dời lên trên đầu phạm vi của chúng trước khi thực thi đoạn code.
Điều này có nghĩa là bất kể hàm và biến được khai báo ở đâu, chúng đều được chuyển lên đầu phạm vi của chúng, bất kể là toàn cục hay cục bộ.

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

*Đáp án*

log ra được `undefined` cho biến name và raise `ReferenceError` cho biến age 

> Đối với biến `name` được khai báo bằng keyword var, khi code được load (đã xảy ra hoisting) biến `name` đã được *định nghĩa* nhưng chưa được *gán* giá trị nên khi log ra sẽ hiển thị là **undefined**.

> Đối với biến `age` được khai báo bằng keyword let, đối với những biến được khai báo bằng let thì chúng ra chỉ có thể truy cập sau khi biến đó được gán giá trị thật sự.

câu hỏi phụ: khi nào declaration diễn ra, khi nào việc assignment diễn ra 

##### 3) Sử dụng từ khóa `this` trong arrow function lên lưu ý điều gì ? 

```js
const shape = {
  radius: 10,
  diameter() {
    return this.radius * 2;
  },
  perimeter: () => 2 * Math.PI * this.radius
};

shape.diameter();
shape.perimeter();
```

*Đáp án*

`20` và `NaN`
Lưu ý rằng giá trị của diameter() là một hàm thông thường, trong khi giá trị của perimeter() là một arrow function.

> Với các arrow function, không giống như các hàm thông thường, từ khóa this ở đây là đề cập đến phạm vi hiện tại của nó (nơi nó được gọi).

> Điều này có nghĩa là khi chúng ta gọi đến permeter(), nó không đề cập đến đối tượng shape, mà là phạm vi xung quanh của nó (ví dụ như đề cập đến window)
> Kết quả là không có giá trị radius trên đối tượng đó, nó trả về undefined.



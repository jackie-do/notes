## Bộ câu hỏi phỏng vấn SQL
### I) Các câu hỏi chung về SQL:
##### 1) Các câu INSERT, UPDATE, DELETE là thuộc về loại DML hay DDL ?
*Đáp án*

>  DML là viết tắt của Ngôn ngữ thao tác dữ liệu (Data Manipulation Language): INSERT, UPDATE và DELETE là các câu lệnh DML.

> DDL là viết tắt của Ngôn ngữ định nghĩa dữ liệu (Data Definition Language): CREATE, ALTER, DROP, RENAME là các câu lệnh DDL

##### 2) Thứ tự các mệnh đề trong SQL SELECT?
*Đáp án*

> Thứ tự các mệnh đề SQL SELECT là: SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY. Trong đó SELECT, FROM là bắt buộc.

##### 3) Truy vấn 3 sinh viên có điểm cao nhất trong table.
Giả sử ta có table `students` có 2 columns: 
- `name` - String
- `marks` - Integer 
Viết 1 câu query lấy 3 học sinh có điểm cao nhất trong table bằng SQL

```SQL
SELECT name, marks 
FROM students
ORDER BY marks DESC
LIMIT 3
```

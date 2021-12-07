Đôi khi dev cần đưa local environment ra internet do một số lý do như:
- Khi làm remote, cần cho QC test. Đang ko cùng mạng local nên ko dùng IP local được
- Cần test/debug HTTPS khi develop
- Khi intergate 3rd party có webhooks thì cũng cần có internet-accessible URL

Để làm được việc này, chúng ta cần sử dụng các dịch vụ tunnels. Thông thường, chúng ta hay dùng [ngrok](https://ngrok.com/). 
Tuy nhiên gần đây nhiều devs phản ánh ngrok rất chậm. Mình đã check và nguyên nhân là gói free đã bị limit lại rất nhiều. 
Đặc biệt là project nào cần load nhiều files JS/CSS/Images thì có thể  ko load nổi luôn

Giải pháp: dùng [Cloudflare Tunnels](https://www.cloudflare.com/products/tunnel/). Nhìn chung cách hoạt động giống ngrok nhưng ko có nhiều limit (coi như ko có)

1) Cài Cloudflared, xem chi tiết: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/installation. 
  - macOS: brew install cloudflare/cloudflare/cloudflared
  - Ubuntu: add Cloudflare package repository theo guide: https://pkg.cloudflare.com/#ubuntu-title, sau đó sudo apt install cloudflared
2) Run cloudflared tunnel --url localhost:3000 (localhost:3000 là local env URL dev thường dùng để test). 
   Trong output sẽ có 1 URL dạng như https://coal-tile-printed-trading.trycloudflare.com, đây là public URL, khi vào sẽ giống như dùng localhost:3000 nhưng đã được published ra internet và proxied qua Cloudflare

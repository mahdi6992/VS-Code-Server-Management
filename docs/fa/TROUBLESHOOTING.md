# راهنمای رفع مشکلات

این سند به شما کمک می‌کند تا مشکلات رایجی که ممکن است در حین نصب یا استفاده از VS Code Server به وجود آید را حل کنید.

## مشکلات اتصال

### پس از نصب نمی‌توانم به VS Code Server دسترسی پیدا کنم

1. **بررسی کنید آیا سرویس در حال اجراست**:
   ```bash
   sudo systemctl status code-server@$USER
   ```
   اگر در حال اجرا نیست، آن را شروع کنید:
   ```bash
   sudo systemctl start code-server@$USER
   ```

2. **پیکربندی Nginx را بررسی کنید**:
   ```bash
   sudo nginx -t
   ```
   اگر خطایی وجود دارد، فایل پیکربندی را در مسیر `/etc/nginx/sites-available/vscode` اصلاح کنید.

3. **تنظیمات فایروال را بررسی کنید**:
   مطمئن شوید پورت‌های 80 و 443 (اگر از SSL استفاده می‌کنید) باز هستند:
   ```bash
   sudo ufw status
   ```
   اگر مسدود هستند:
   ```bash
   sudo ufw allow 80/tcp
   sudo ufw allow 443/tcp
   ```

4. **تنظیمات DNS دامنه را بررسی کنید**:
   مطمئن شوید که دامنه شما به درستی به آدرس IP سرور شما اشاره می‌کند.

## مشکلات احراز هویت

### رمز عبور را فراموش کرده‌ام

1. رمز عبور را با انتخاب گزینه 3 از منوی اصلی بازنشانی کنید.
2. اگر نمی‌توانید به منو دسترسی پیدا کنید، می‌توانید رمز عبور را به صورت دستی به‌روزرسانی کنید:
   ```bash
   sudo nano /etc/code-server/config.yaml
   ```
   خط حاوی `password:` را پیدا کرده و آن را به‌روزرسانی کنید.
   سپس سرویس را مجدداً راه‌اندازی کنید:
   ```bash
   sudo systemctl restart code-server@$USER
   ```

## مشکلات گواهی SSL

### گواهی SSL منقضی شده است

1. گواهی را تمدید کنید:
   ```bash
   sudo certbot renew
   ```

2. اگر این کار نکرد، یک گواهی جدید ایجاد کنید:
   ```bash
   sudo certbot --nginx -d yourdomain.com
   ```

## مشکلات به‌روزرسانی

### به‌روزرسانی با شکست مواجه می‌شود

1. اتصال اینترنت را بررسی کنید:
   ```bash
   ping github.com
   ```

2. سعی کنید آخرین نسخه را به صورت دستی دانلود کنید:
   ```bash
   cd ~
   wget https://github.com/coder/code-server/releases/download/latest/code-server_latest_amd64.deb
   sudo dpkg -i code-server_latest_amd64.deb
   rm code-server_latest_amd64.deb
   sudo systemctl restart code-server@$USER
   ```

## مشکلات عملکرد

### VS Code Server به کندی اجرا می‌شود

1. **منابع سرور را بررسی کنید**:
   ```bash
   top
   ```
   مطمئن شوید که CPU و RAM کافی در دسترس دارید.

2. **افزونه‌های غیرضروری را ببندید**:
   تعداد زیاد افزونه می‌تواند عملکرد را کند کند.

3. **فضای دیسک را بررسی کنید**:
   ```bash
   df -h
   ```
   اگر فضای دیسک شما کم است، مقداری فضا آزاد کنید.

## دریافت کمک بیشتر

اگر همچنان با مشکلاتی مواجه هستید که در این راهنما پوشش داده نشده است، لطفاً:

1. به [وب‌سایت DevMeta](https://devmeta.ir) برای اطلاعات بیشتر مراجعه کنید
2. یک Issue در [مخزن GitHub ما](https://github.com/mahdi6992/VS-Code-Server-Management/issues) باز کنید 
# VS Code Server Management Script
### Developed by Mahdi Saberi (DevMeta)

A comprehensive management interface for VS Code Server installation and configuration on Linux servers.

[🇮🇷 Persian Documentation (مستندات فارسی)](#نسخه-فارسی--persian-version)

## What is VS Code Server?

VS Code Server is an open-source version of Visual Studio Code that runs in the browser. Developed by Coder, it allows you to set up the powerful VS Code IDE on a server and access it through any web browser.

### Key Benefits:

1. **Access from Any Device**: Access your development environment from any device with a web browser - even mobile phones, tablets, or older computers.

2. **Centralized Code Storage**: All your projects and code are stored on the server, eliminating the need for synchronization or worrying about code loss.

3. **Enhanced Security**: Your code never leaves your server, everything runs on your infrastructure.

4. **Full VS Code Features**: Nearly all VS Code features including:
   - Extensions installation
   - IntelliSense (code completion)
   - Integrated terminal
   - Debugger and Git tools
   - File management and project execution

5. **High Performance**: All code processing and program execution happens on the server, reducing load on your local computer.

## Quick Start

```bash
git clone https://github.com/mahdi6992/VS-Code-Server-Management.git
cd VS-Code-Server-Management
chmod +x "VS-Code-Server-Management.sh"
./VS-Code-Server-Management.sh
```

## Features

This script provides a complete management interface for VS Code Server:

1. **Install VS Code Server**: Sets up VS Code Server with Nginx as a reverse proxy
2. **Create New VS Code Account**: Add new user accounts to your server
3. **Change VS Code Server Password**: Update the access password
4. **Update VS Code Server**: Upgrade to the latest version
5. **Backup VS Code Server Settings**: Create a complete backup of all configurations
6. **Change Domain**: Update your domain without reinstalling

## Requirements

- Debian/Ubuntu-based Linux distribution
- Root/sudo access
- A domain name pointing to your server's IP address (optional)

## Documentation

For detailed documentation, please visit:

- [Installation Guide](./docs/en/INSTALLATION.md)
- [Troubleshooting](./docs/en/TROUBLESHOOTING.md)

## Use Cases

- **Remote Developers**: For those who want to work from anywhere
- **Development Teams**: Create standardized development environments for all team members
- **Programming Education**: Set up a unified environment for all students
- **Resource-Limited Systems**: Code on lightweight devices like Chromebooks

## How to Use the Management Interface

After running the script, an interactive menu will appear. Select any option by entering its number:

1. For initial installation, select option 1 and enter your domain or IP address and password.
2. To create a new user, select option 2 and enter the username and password.
3. To change the password, select option 3 and enter the new password.
4. To update to the latest version, select option 4.
5. To create a backup, select option 5.
6. To change the domain, select option 6 and enter the new domain or IP address.

## Security

This script automatically implements:
- Password authentication
- SSL/TLS encryption for communications (optional)
- Nginx configuration as a reverse proxy
- Service isolation using systemd

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

You are free to use, modify, and distribute this script and its documentation, provided that you include proper attribution to the original author (Mahdi Saberi - DevMeta).

## Support

For support and more information, visit [DevMeta](https://devmeta.ir).

---

# نسخه فارسی | Persian Version

<details>
<summary>برای مشاهده نسخه فارسی کلیک کنید / Click to view Persian version</summary>

<div dir="rtl" align="right">

# اسکریپت مدیریت VS Code Server
### توسعه یافته توسط مهدی صابری (DevMeta)

یک رابط مدیریتی جامع برای نصب و پیکربندی VS Code Server روی سرورهای لینوکس.

## VS Code Server چیست؟

VS Code Server نسخه متن‌باز ویژوال استودیو کد است که در مرورگر اجرا می‌شود. این پروژه که توسط شرکت Coder توسعه داده شده، به شما امکان می‌دهد تا محیط توسعه قدرتمند VS Code را روی یک سرور راه‌اندازی کنید و از طریق هر مرورگر وبی به آن دسترسی داشته باشید.

### مزایای اصلی:

1. **دسترسی از هر دستگاهی**: می‌توانید از هر دستگاهی که مرورگر وب دارد، به محیط توسعه خود دسترسی پیدا کنید - حتی موبایل، تبلت یا کامپیوترهای قدیمی.

2. **ذخیره‌سازی متمرکز کد**: تمام پروژه‌ها و کدهای شما روی سرور ذخیره می‌شوند، بنابراین نیازی به همگام‌سازی یا نگرانی درباره از دست دادن کد ندارید.

3. **امنیت بالاتر**: کد شما هرگز کامپیوتر محلی را ترک نمی‌کند، همه چیز روی سرور شما اجرا می‌شود.

4. **قابلیت‌های کامل VS Code**: تقریباً تمام ویژگی‌های VS Code از جمله:
   - نصب افزونه‌ها (Extensions)
   - تکمیل خودکار کد (IntelliSense)
   - استفاده از ترمینال یکپارچه
   - دیباگر و ابزارهای مدیریت گیت
   - مدیریت فایل و اجرای پروژه

5. **عملکرد بالا**: تمام عملیات پردازش کد و اجرای برنامه‌ها روی سرور انجام می‌شود، بنابراین به منابع کامپیوتر محلی فشار نمی‌آید.

## شروع سریع

```bash
git clone https://github.com/mahdi6992/VS-Code-Server-Management.git
cd VS-Code-Server-Management
chmod +x "VS-Code-Server-Management.sh"
./VS-Code-Server-Management.sh
```

## ویژگی‌ها

این اسکریپت یک رابط مدیریتی کامل برای VS Code Server ارائه می‌دهد:

1. **نصب VS Code Server**: راه‌اندازی VS Code Server با Nginx به عنوان پراکسی معکوس
2. **ایجاد حساب کاربری جدید**: افزودن کاربران جدید به سرور شما
3. **تغییر رمز عبور VS Code Server**: به‌روزرسانی رمز عبور دسترسی
4. **به‌روزرسانی VS Code Server**: ارتقا به آخرین نسخه
5. **تهیه نسخه پشتیبان از تنظیمات**: ایجاد یک نسخه پشتیبان کامل از تمام پیکربندی‌ها
6. **تغییر دامنه**: به‌روزرسانی دامنه بدون نیاز به نصب مجدد

## پیش‌نیازها

- سیستم عامل لینوکس مبتنی بر دبیان/اوبونتو
- دسترسی روت یا سودو
- یک نام دامنه که به آدرس IP سرور شما اشاره می‌کند (اختیاری)

## مستندات

برای مستندات دقیق‌تر، لطفاً به این صفحات مراجعه کنید:

- [راهنمای نصب](./docs/fa/INSTALLATION.md)
- [رفع مشکلات](./docs/fa/TROUBLESHOOTING.md)

## موارد استفاده

- **توسعه دهندگان از راه دور**: برای کسانی که می‌خواهند از هر مکانی کار کنند
- **تیم‌های توسعه**: ایجاد محیط‌های توسعه استاندارد برای تمام اعضای تیم
- **آموزش برنامه‌نویسی**: راه‌اندازی یک محیط یکسان برای تمام دانشجویان
- **سیستم‌های با منابع محدود**: کدنویسی روی دستگاه‌های سبک مانند Chromebook

## نحوه استفاده از رابط مدیریتی

پس از اجرای اسکریپت، یک منوی تعاملی نمایش داده می‌شود. برای انتخاب هر گزینه، شماره آن را وارد کنید:

1. برای نصب اولیه، گزینه 1 را انتخاب کنید و دامنه یا آدرس IP و رمز عبور مورد نظر خود را وارد نمایید.
2. برای ایجاد کاربر جدید، گزینه 2 را انتخاب کنید و نام کاربری و رمز عبور را وارد کنید.
3. برای تغییر رمز عبور، گزینه 3 را انتخاب و رمز جدید را وارد کنید.
4. برای به‌روزرسانی به آخرین نسخه، گزینه 4 را انتخاب کنید.
5. برای تهیه نسخه پشتیبان، گزینه 5 را انتخاب کنید.
6. برای تغییر دامنه، گزینه 6 را انتخاب کرده و دامنه یا آدرس IP جدید را وارد کنید.

## امنیت

این اسکریپت به طور خودکار موارد زیر را پیاده‌سازی می‌کند:
- احراز هویت با رمز عبور
- امکان رمزگذاری SSL/TLS برای ارتباطات (اختیاری)
- پیکربندی Nginx به عنوان پراکسی معکوس
- ایزوله کردن سرویس با استفاده از systemd

## مجوز

این پروژه تحت مجوز MIT منتشر شده است - برای جزئیات بیشتر به فایل [LICENSE](LICENSE) مراجعه کنید.

شما آزاد هستید از این اسکریپت و مستندات آن استفاده، اصلاح و توزیع کنید، به شرطی که منبع اصلی و نویسنده (مهدی صابری - DevMeta) را ذکر نمایید.

## پشتیبانی

برای پشتیبانی و اطلاعات بیشتر، به [DevMeta](https://devmeta.ir) مراجعه کنید.

</div>

</details>
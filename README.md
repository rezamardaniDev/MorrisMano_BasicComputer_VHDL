## پروژه پیاده‌سازی کامپیوتر پایه موریس مانو با VHDL

## معرفی پروژه
این پروژه به منظور پیاده‌سازی کامپیوتر پایه معرفی شده در کتاب "کامپیوتر پایه موریس مانو" با استفاده از زبان توصیف سخت‌افزار VHDL طراحی شده است. تمامی بخش‌های کامپیوتر پایه شامل ثبات‌ها، حافظه، گذرگاه مشترک، واحد محاسبات و منطق (ALU) و واحد کنترل به صورت جداگانه طراحی و پیاده‌سازی شده‌اند. 🚀

---

## محتویات پروژه

### فایل‌ها

1. **`register.vhd`**
   - پیاده‌سازی ثبات 8 بیتی با قابلیت بارگذاری داده و ریست.

2. **`memory_unit.vhd`**
   - حافظه RAM با قابلیت خواندن و نوشتن داده.

3. **`common_bus.vhd`**
   - گذرگاه مشترک برای انتقال داده بین ثبات‌ها و واحد حافظه.

4. **`alu.vhd`**
   - واحد محاسبات و منطق با قابلیت اجرای عملیات جمع، تفریق، AND، OR و NOT.

5. **`control_unit.vhd`**
   - واحد کنترل برای تولید سیگنال‌های کنترلی بر اساس دستور فعلی و حالت سیستم.

6. **`cpu_top.vhd`**
   - ماژول اصلی که تمامی اجزای بالا را به یکدیگر متصل می‌کند. 💻

---

## پیش‌نیازها

برای شبیه‌سازی و اجرای این پروژه نیاز به ابزارهای زیر دارید:

- **نرم‌افزار ModelSim یا Vivado**
- آشنایی اولیه با زبان VHDL
- آشنایی با مفاهیم کامپیوتر پایه (ثبات‌ها، گذرگاه‌ها، واحد کنترل و ...)

---

## مراحل اجرا

1. **ایمپورت فایل‌ها**
   - تمامی فایل‌های VHDL را در یک پروژه جدید وارد کنید.

2. **کامپایل پروژه**
   - ابتدا فایل‌های جداگانه (مثل `register.vhd` و `memory_unit.vhd`) را کامپایل کنید.
   - در نهایت فایل `cpu_top.vhd` را کامپایل کنید.

3. **بررسی خروجی‌ها**
   - اطمینان حاصل کنید که تمامی ثبات‌ها، حافظه و ALU به درستی کار می‌کنند و سیگنال‌های کنترلی صحیح تولید می‌شوند. ✅

---

## مثال دستورات

### نمونه‌ای از دستورها
- **جمع:** دستور با کد عملیاتی `0001`.
- **تفریق:** دستور با کد عملیاتی `0010`.
- **AND:** دستور با کد عملیاتی `0100`.

---

### اگر این پروژه برای شما مفید بوده، لطفاً به ریپازیتوری ⭐️ بدهید!


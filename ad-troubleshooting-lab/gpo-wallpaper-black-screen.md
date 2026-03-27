# 🖥️ GPO Wallpaper Issue – Black Screen

## 📌 Overview

A GPO was configured to enforce a desktop wallpaper, but the client displayed a black screen instead.

---

## ⚠️ Symptoms

* Wallpaper remained black
* GPO applied successfully
* UNC path accessible
* Registry values correct

---

## 🔍 Investigation

* Verified GPO configuration and OU linking
* Checked user permissions and group membership
* Tested access to:

  ```
  \\DC01\wallpaper\wallpaper.jpg
  ```
* Verified registry:

  ```
  HKCU\Control Panel\Desktop
  ```

---

## 💥 Root Cause

Corrupted wallpaper cache on the client.

Location:

```
%appdata%\Microsoft\Windows\Themes
```

Affected files:

* CachedImage_*
* TranscodedWallpaper

---

## 🛠️ Resolution

* Delete cached wallpaper files
* Log off and log back in

---

## ✅ Result

Wallpaper applied correctly and consistently.

---

## 🧠 Takeaway

Even when GPO and registry are correct, client-side cache can override expected behavior.

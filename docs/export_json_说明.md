# World War Archives - 导出 JSON 说明

## 一、正确执行方式（避免 `command not found: #`）

**不要整段复制带 `#` 注释的内容**，否则 zsh 会把注释行当命令执行。请只复制下面两行（或分两次执行）：

```bash
export DATABASE_URL="postgresql://postgres:Zjw%40110547@db.ydxbjthtogjaqhfhmncc.supabase.co:5432/postgres"
./scripts/run_export.sh
```

或一行搞定（连接串和脚本写在同一行）：

```bash
DATABASE_URL="postgresql://postgres:Zjw%40110547@db.ydxbjthtogjaqhfhmncc.supabase.co:5432/postgres" ./scripts/run_export.sh
```

---

## 二、若报错：`could not translate host name ... to address`

说明当前网络 **无法解析** Supabase 的直连主机名 `db.ydxbjthtogjaqhfhmncc.supabase.co`。可依次尝试：

### 方法 1：改用 Supabase 池化连接（推荐）

1. 打开 Supabase 控制台：  
   **https://supabase.com/dashboard/project/ydxbjthtogjaqhfhmncc/settings/database**
2. 在 **Connection string** 区域找到 **Session pooler** 或 **Transaction pooler**（不是 Direct connection）。
3. 选择 **URI**，复制整段连接串。
4. 把其中的 `[YOUR-PASSWORD]` 换成你的数据库密码。若密码是 `Zjw@110547`，在 URI 里要写成 **`Zjw%40110547`**（`@` 写成 `%40`）。
5. 在终端执行（**必须使用你刚复制的完整 URI**，不要用文档里的占位符如 `aws-0-xx-xxxx`）：

```bash
export DATABASE_URL="你从 Supabase 复制的完整 URI，并把 [YOUR-PASSWORD] 换成 Zjw%40110547"
./scripts/run_export.sh
```

**从哪里复制**：Project Settings → **Database** → **Connection string** → 选 **Session pooler** 或 **Transaction pooler** → 点 **URI** 旁的复制按钮。

池化连接的主机名类似 `aws-0-us-east-1.pooler.supabase.com`，很多网络下比直连更好解析。

**注意**：文档里的 `aws-0-xx-xxxx` 是占位符，不能原样使用。必须到 Supabase 控制台复制**完整 URI**（见下方「从哪里复制」）。

**若不确定项目所在区域**，可依次尝试常见池化主机（把下面某一行整段当作 `DATABASE_URL` 的值，密码已写成 `Zjw%40110547`）：

- 美东：`postgresql://postgres.ydxbjthtogjaqhfhmncc:Zjw%40110547@aws-0-us-east-1.pooler.supabase.com:6543/postgres`
- 新加坡：`postgresql://postgres.ydxbjthtogjaqhfhmncc:Zjw%40110547@aws-0-ap-southeast-1.pooler.supabase.com:6543/postgres`
- 法兰克福：`postgresql://postgres.ydxbjthtogjaqhfhmncc:Zjw%40110547@aws-0-eu-central-1.pooler.supabase.com:6543/postgres`

执行示例（只选一个区域试）：

```bash
export DATABASE_URL="postgresql://postgres.ydxbjthtogjaqhfhmncc:Zjw%40110547@aws-0-ap-southeast-1.pooler.supabase.com:6543/postgres"
./scripts/run_export.sh
```

若仍报 `could not translate host name`，说明该区域不对或网络仍无法访问，请务必从 Supabase 控制台复制**你项目实际显示**的 Session/Transaction pooler URI。

### 方法 2：检查网络与 DNS

- 换一个网络试试（例如手机热点）。
- 在终端执行：`nslookup db.ydxbjthtogjaqhfhmncc.supabase.co`，看是否能解析出 IP。若一直失败，多半是当前网络或 DNS 无法访问 Supabase。

### 方法 3：在 Supabase 所在环境跑导出

若你有能在 Supabase 同区域/可访问外网的机器（如云主机），在该机器上安装 Python + psycopg2，设置同样的 `DATABASE_URL` 后执行 `./scripts/run_export.sh`，再把生成的 `World War Archives/Data/*.json` 拷回本机。

---

## 三、导出成功时

终端会看到类似输出：

- `archives.json 已写入`
- `battle_units.json: N 条`、`battle_images.json: N 条` 等
- `导出完成，输出目录: .../World War Archives/Data/`

JSON 文件在 **`World War Archives/Data/`** 目录下，Xcode 编译时会把该目录打进 App，无需再改代码。

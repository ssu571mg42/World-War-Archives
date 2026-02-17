# 从项目内 SQL 生成 JSON（无需 Supabase）

App 读的是 **`World War Archives/Data/`** 下的 JSON，数据来源不必是 Supabase。你项目里已经有**全部数据的 SQL**，只要在**本地**执行这些 SQL，再把结果导出成 JSON 即可。

---

## 方式一：一键脚本（推荐，需 Docker）

本机安装好 **Docker** 后，在项目根目录执行：

```bash
cd "/Users/limao/2026/World War Archives"
./scripts/sql_to_json_local.sh
```

脚本会：

1. 用 Docker 启动一个**临时** PostgreSQL（端口默认 5433，避免与本地已有 Postgres 冲突）
2. 按 `docs/seed_execution_order.md` 的顺序执行全部 SQL（full_setup → soldier_stories → 战场迁移 → 四语言 → 所有 seed）
3. 用现有导出脚本生成 `archives.json` 及各类详情 JSON 到 `World War Archives/Data/`
4. 停止并删除临时容器

**不需要** Supabase、不需要配置 DATABASE_URL，也不需要能访问外网数据库。

若 5433 端口已被占用，可指定其他端口再执行：

```bash
LOCAL_PORT=5434 ./scripts/sql_to_json_local.sh
```

---

## 方式二：本机已安装 PostgreSQL 时

若你本机已经装了 PostgreSQL（例如用 Homebrew 的 `brew install postgresql`），可以自己建一个空库，再执行 SQL 并导出：

```bash
# 1. 创建数据库（按你本机配置修改用户/库名）
createdb wwa_export

# 2. 设置连接串并执行全部 SQL
export DATABASE_URL="postgresql://$(whoami)@127.0.0.1:5432/wwa_export"
./scripts/run_all_sql.sh

# 3. 导出 JSON（需有 .venv 和 psycopg2）
. .venv/bin/activate
python scripts/export_postgres_to_json.py
```

JSON 会出现在 `World War Archives/Data/`。之后若不再需要该库，可 `dropdb wwa_export`。

---

## 小结

| 方式 | 条件 | 说明 |
|------|------|------|
| **方式一** | 已安装 Docker | 一条命令：`./scripts/sql_to_json_local.sh`，不依赖 Supabase |
| **方式二** | 本机已装 Postgres | 建空库 → `run_all_sql.sh` → `export_postgres_to_json.py` |
| 从 Supabase 导出 | 能连上 Supabase | 仅当数据只在 Supabase 且网络可达时用 `run_export.sh` |

**数据都在项目 SQL 里，优先用方式一或方式二即可，不必从 Supabase 导出。**

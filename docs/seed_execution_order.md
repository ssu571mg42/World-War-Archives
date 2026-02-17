# World War Archives - SQL 种子脚本执行顺序

**说明**：以下顺序仅用于**一次性**从 SQL 生成 JSON（如运行 `scripts/sql_to_json_local.sh`）或从已有数据库导出。日常内容维护请直接编辑 `World War Archives/Data/*.json`，无需执行 SQL，见 [内容维护说明.md](内容维护说明.md)。

从零恢复数据库并导出为 App 所用 JSON 时，建议按以下顺序执行 SQL。

---

## 一、推荐执行顺序

### 1. 建表与北非基础数据（必选）

| 顺序 | 文件 | 说明 |
|------|------|------|
| 1 | `supabase_full_setup.sql` | 建表（campaigns, battles, events, landmarks, battle_units, battle_unit_equipment, battle_images, battle_timeline_events, tank_models, aircraft_models, units, unit_history_events）及北非基础数据 |

### 2. 士兵故事表（必选）

| 顺序 | 文件 | 说明 |
|------|------|------|
| 2 | `supabase_soldier_stories.sql` | 创建 `soldier_stories` 表 |

### 3. 战场/剧院迁移（按需）

| 顺序 | 文件 | 说明 |
|------|------|------|
| 3a | `supabase_european_theaters_migration.sql` | 欧洲战场相关 |
| 3b | `supabase_european_theaters_data_update.sql` | 欧洲战场数据更新 |
| 3c | `supabase_nordic_arctic_theater_migration.sql` | 北欧/北极战场 |
| 3d | `supabase_pacific_theater_migration.sql` | 太平洋战场 |
| 3e | `supabase_china_theater_migration.sql` | 中国战场 |
| 3f | `supabase_eastern_front_theater_update.sql` | 东线战场更新 |
| 3g | `supabase_atlantic_theater_migration.sql` | 大西洋战场 |

### 4. 四语言列迁移（必选，若需中/英/日/德）

| 顺序 | 文件 | 说明 |
|------|------|------|
| 4 | `supabase_four_languages_migration.sql` | 为各表增加 `_ja` / `_de` 等列 |

### 5. 种子数据（supabase_seed_*.sql）

种子脚本多使用 `WHERE NOT EXISTS` / 幂等写法，**执行顺序不严格**。建议：

- **先跑各战场 campaign**（如 `supabase_seed_pacific_campaign.sql`、`supabase_seed_china_campaign.sql`、`supabase_seed_italy_campaign.sql` 等），再跑该战场的 battles/events/landmarks/stories。
- 或直接按**文件名字母顺序**执行全部 `supabase_seed_*.sql`。

以下为项目内**全部** `supabase*.sql` 文件列表（按字母排序），便于在 Supabase SQL Editor 或本地 psql 中批量执行。**不要执行** `supabase_cleanup_non_africa.sql`（会删除非非洲数据）；从零建库时用 `supabase_full_setup.sql` 即可，无需再执行 `supabase_migration.sql`。

---

## 二、全部 SQL 文件列表（按字母，共 157 个）

```
supabase_atlantic_theater_migration.sql
supabase_battle_detail_migration.sql
supabase_battle_images_migration.sql
supabase_battle_timeline_migration.sql
supabase_china_theater_migration.sql
supabase_cleanup_non_africa.sql
supabase_eastern_front_theater_update.sql
supabase_el_alamein_data.sql
supabase_equipment_models_migration.sql
supabase_european_theaters_data_update.sql
supabase_european_theaters_migration.sql
supabase_four_languages_migration.sql
supabase_full_setup.sql
supabase_migration.sql
supabase_nordic_arctic_theater_migration.sql
supabase_pacific_theater_migration.sql
supabase_seed_africa_coordinates_fix.sql
supabase_seed_africa_stories.sql
supabase_seed_africa_stories_lesser_known.sql
supabase_seed_atlantic.sql
supabase_seed_atlantic_detail.sql
supabase_seed_atlantic_stories.sql
supabase_seed_balkans.sql
supabase_seed_balkans_events_landmarks.sql
supabase_seed_balkans_events_landmarks_expanded.sql
supabase_seed_balkans_expanded.sql
supabase_seed_balkans_stories.sql
supabase_seed_balkans_stories_expanded.sql
supabase_seed_battle_detail.sql
supabase_seed_battle_detail_completion.sql
supabase_seed_battle_detail_dakar.sql
supabase_seed_battle_detail_first_alamein.sql
supabase_seed_battle_images.sql
supabase_seed_battle_images_first_alamein.sql
supabase_seed_battle_timeline.sql
supabase_seed_battle_timeline_first_alamein.sql
supabase_seed_battle_timeline_images_north_africa.sql
supabase_seed_caucasus_expansion.sql
supabase_seed_china_battle_detail.sql
supabase_seed_china_battle_images.sql
supabase_seed_china_battle_timeline.sql
supabase_seed_china_campaign.sql
supabase_seed_china_campaign_expansion.sql
supabase_seed_china_events.sql
supabase_seed_china_events_expansion.sql
supabase_seed_china_landmarks.sql
supabase_seed_china_landmarks_expansion.sql
supabase_seed_china_stories.sql
supabase_seed_china_stories_expansion.sql
supabase_seed_dakar.sql
supabase_seed_data.sql
supabase_seed_eastern_front.sql
supabase_seed_eastern_front_berlin_endgame.sql
supabase_seed_eastern_front_detail.sql
supabase_seed_eastern_front_events.sql
supabase_seed_eastern_front_events_expanded.sql
supabase_seed_eastern_front_events_expansion.sql
supabase_seed_eastern_front_expanded.sql
supabase_seed_eastern_front_landmarks.sql
supabase_seed_eastern_front_landmarks_expanded.sql
supabase_seed_eastern_front_landmarks_expansion.sql
supabase_seed_eastern_front_stories.sql
supabase_seed_eastern_front_stories_expanded.sql
supabase_seed_eastern_front_stories_expansion.sql
supabase_seed_economy_policy_perspective.sql
supabase_seed_equipment_models.sql
supabase_seed_equipment_refinement.sql
supabase_seed_events_prewar_diplomacy.sql
supabase_seed_gabon_detail.sql
supabase_seed_german_hq_late_weapons.sql
supabase_seed_italy_battle_detail.sql
supabase_seed_italy_battle_detail_extra.sql
supabase_seed_italy_battle_images.sql
supabase_seed_italy_battle_timeline.sql
supabase_seed_italy_battle_timeline_anzio.sql
supabase_seed_italy_battles_extra.sql
supabase_seed_italy_campaign.sql
supabase_seed_italy_events.sql
supabase_seed_italy_events_allied_perspective.sql
supabase_seed_italy_events_extra.sql
supabase_seed_italy_events_italian_perspective.sql
supabase_seed_italy_landmarks.sql
supabase_seed_italy_landmarks_expansion.sql
supabase_seed_italy_landmarks_extra.sql
supabase_seed_italy_stories.sql
supabase_seed_italy_stories_allied_perspective.sql
supabase_seed_italy_stories_expansion.sql
supabase_seed_italy_stories_extra.sql
supabase_seed_italy_stories_italian_perspective.sql
supabase_seed_kasserine_detail.sql
supabase_seed_keren_battle.sql
supabase_seed_logistics_perspective.sql
supabase_seed_lrdg_sas.sql
supabase_seed_madagascar.sql
supabase_seed_middle_east_india.sql
supabase_seed_nordic_arctic.sql
supabase_seed_nordic_arctic_detail.sql
supabase_seed_nordic_arctic_detail_expanded.sql
supabase_seed_nordic_arctic_expanded.sql
supabase_seed_nordic_arctic_heavy_water.sql
supabase_seed_nordic_arctic_stories.sql
supabase_seed_nordic_arctic_stories_expanded.sql
supabase_seed_north_africa_expanded.sql
supabase_seed_north_africa_expanded_detail.sql
supabase_seed_omaha_detail.sql
supabase_seed_pacific_balloon_aleutians_shinano.sql
supabase_seed_pacific_battle_detail.sql
supabase_seed_pacific_battle_detail_expansion.sql
supabase_seed_pacific_battle_images.sql
supabase_seed_pacific_battle_images_expansion.sql
supabase_seed_pacific_battle_timeline.sql
supabase_seed_pacific_battle_timeline_expansion.sql
supabase_seed_pacific_campaign.sql
supabase_seed_pacific_events.sql
supabase_seed_pacific_events_economic_policy.sql
supabase_seed_pacific_events_expansion.sql
supabase_seed_pacific_events_japanese_perspective.sql
supabase_seed_pacific_events_logistics.sql
supabase_seed_pacific_events_touching.sql
supabase_seed_pacific_events_touching_japanese.sql
supabase_seed_pacific_landmarks.sql
supabase_seed_pacific_landmarks_expansion.sql
supabase_seed_pacific_rabaul_yamamoto_zero_turkeyshoot.sql
supabase_seed_pacific_stories.sql
supabase_seed_pacific_stories_american_perspective.sql
supabase_seed_pacific_stories_economic_policy.sql
supabase_seed_pacific_stories_expansion.sql
supabase_seed_pacific_stories_japanese_perspective.sql
supabase_seed_pacific_stories_logistics.sql
supabase_seed_pacific_stories_touching.sql
supabase_seed_pacific_stories_touching_japanese.sql
supabase_seed_pacific_truk_bicycle_oil_submarine.sql
supabase_seed_peenemunde.sql
supabase_seed_polish_siberian_exodus.sql
supabase_seed_special_topics_raids_weapons.sql
supabase_seed_submarine_railway_oil.sql
supabase_seed_takoradi_route.sql
supabase_seed_tobruk.sql
supabase_seed_torch_algiers.sql
supabase_seed_torch_casablanca.sql
supabase_seed_torch_oran.sql
supabase_seed_tunisia_campaign.sql
supabase_seed_units.sql
supabase_seed_units_north_africa_extra.sql
supabase_seed_units_tunisia.sql
supabase_seed_western_europe.sql
supabase_seed_western_europe_axis_perspective.sql
supabase_seed_western_europe_axis_stories_expansion.sql
supabase_seed_western_europe_expansion.sql
supabase_seed_western_europe_france_1940.sql
supabase_seed_western_europe_france_germany_border_1944.sql
supabase_seed_western_europe_raids_special.sql
supabase_seed_western_europe_southern_france.sql
supabase_seed_western_europe_touching_stories.sql
supabase_soldier_stories.sql
supabase_units_migration.sql
supabase_user_data_migration.sql
```

---

## 三、导出 JSON

执行完上述 SQL 后，使用项目内 Python 脚本从当前库导出 App 所用 JSON：

1. 设置环境变量：`export DATABASE_URL="postgresql://用户:密码@主机:5432/数据库名"`
2. 安装依赖：`pip install psycopg2-binary`
3. 运行：`python3 scripts/export_postgres_to_json.py`

输出目录：`World War Archives/Data/`，包含 `archives.json` 以及 `battle_units.json`、`battle_unit_equipment.json`、`battle_images.json`、`battle_timeline_events.json`、`tank_models.json`、`aircraft_models.json`、`units.json`、`unit_history_events.json`。

详见 `docs/重新添加内容说明.md` 与脚本内注释。

---

## 四、一键执行（可选）

若已配置好 PostgreSQL（本地或 Supabase 连接串），可使用项目内脚本按推荐顺序依次执行全部 SQL：

```bash
# 密码中若含 @，请写成 %40，例如：Zjw@110547 → Zjw%40110547
export DATABASE_URL="postgresql://用户:密码@主机:5432/数据库名"
./scripts/run_all_sql.sh
```

脚本会依次执行：`full_setup` → `soldier_stories` → 战场迁移（7 个）→ `four_languages_migration` → 所有 `supabase_seed_*.sql` 及 `supabase_el_alamein_data.sql`（按字母顺序）。执行完毕后可直接运行 `python3 scripts/export_postgres_to_json.py` 导出 JSON。

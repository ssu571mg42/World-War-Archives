# 太平洋战场种子 SQL 执行顺序

以下四个文件位于项目**根目录**（与 `World War Archives` 文件夹同级），按顺序在 Supabase SQL Editor 中执行。

## 在 Cursor 中打开方式

- **快速打开**：按 `Cmd + P`（Mac）或 `Ctrl + P`（Windows），输入 `pacific`，选择对应文件。
- **侧边栏**：在左侧文件树中展开项目根目录，直接点击文件名。

## 根目录下的文件路径（相对路径）

**基础种子（战役 / 事件 / 纪念处 / 故事）：**
```
supabase_seed_pacific_campaign.sql    ← 第 1 个执行
supabase_seed_pacific_events.sql      ← 第 2 个执行
supabase_seed_pacific_landmarks.sql   ← 第 3 个执行
supabase_seed_pacific_stories.sql     ← 第 4 个执行
```

**战役详情与时间线、图片（可选，需已执行 supabase_battle_detail_migration / battle_timeline / battle_images）：**
```
supabase_seed_pacific_battle_detail.sql    ← 珍珠港、中途岛、瓜岛参战单位与装备
supabase_seed_pacific_battle_timeline.sql  ← 上述三场战役时间线
supabase_seed_pacific_battle_images.sql    ← 珍珠港、中途岛、瓜岛、硫磺岛图片
```

**扩展种子（在基础种子与上述详情/时间线/图片之后执行）：**
```
supabase_seed_pacific_battle_detail_expansion.sql   ← 珊瑚海、莱特湾、硫磺岛、冲绳参战单位与装备
supabase_seed_pacific_battle_timeline_expansion.sql ← 上述四场战役时间线
supabase_seed_pacific_battle_images_expansion.sql   ← 珊瑚海、莱特湾、冲绳图片
supabase_seed_pacific_events_expansion.sql           ← 爪哇海、莱特湾神风、大和号天一号、波茨坦公告
supabase_seed_pacific_landmarks_expansion.sql       ← 莱特登陆纪念、太平洋战争博物馆、长崎和平公园、关岛
supabase_seed_pacific_stories_expansion.sql         ← 珊瑚海列克星敦、塔菲三号、硫磺岛插旗六人
supabase_seed_pacific_rabaul_yamamoto_zero_turkeyshoot.sql ← 拉包尔要塞、山本坠机、阿留申/达尔文零战、猎火鸡（事件+地标+故事）
supabase_seed_pacific_balloon_aleutians_shinano.sql         ← 日本气球炸弹轰炸美国本土、阿留申/白令方向战斗、信浓号被击沉（事件+故事）
supabase_seed_pacific_truk_bicycle_oil_submarine.sql        ← 特鲁克联合舰队基地与冰雹、银轮部队、日军石油与运输线、伊-25 轰炸美国（事件+故事）
```

**日军视角（事件与故事，在扩展种子之后执行）：**
```
supabase_seed_pacific_events_japanese_perspective.sql   ← 机动部队出击、中途岛日军惨败、神风编成、栗田转向、决号作战
supabase_seed_pacific_stories_japanese_perspective.sql  ← 南云机动部队、中途岛覆灭、栗林与硫磺岛、大和号天一号、第32军、大西与神风、玉音放送等
```

**美军/盟军视角（故事）：**
```
supabase_seed_pacific_stories_american_perspective.sql ← 埃文斯与约翰斯顿号、博格、海岸监视员克莱门斯、尤金·斯莱奇、卡尔森突击队马金岛
```

**后勤视角（事件与故事，双方）：**
```
supabase_seed_pacific_events_logistics.sql   ← 东京快车、亨德森机场 Seabees、瓜岛日军撤出、驼峰空运、利多公路、饥饿作战
supabase_seed_pacific_stories_logistics.sql  ← 鼠输送驱逐舰、餓島撤出、饥饿作战下日本海运；Seabees 弹坑班组、驼峰飞行员、利多公路工兵
```

**经济与政策视角（事件与故事，双方）：**
```
supabase_seed_pacific_events_economic_policy.sql   ← 大东亚共荣圈、中国租借、9066 日裔拘禁、大东亚省、开罗宣言、日本本土配给
supabase_seed_pacific_stories_economic_policy.sql ← 9066 与拘禁营、442 团 Go For Broke；共荣圈占领区经济、本土主妇与配给
```

**感人、有趣（事件与故事）：**
```
supabase_seed_pacific_events_touching.sql   ← 杜立特与中国村民、麦克阿瑟「我回来了」、卡巴那端营救、印第安纳波利斯号、V-J Day
supabase_seed_pacific_stories_touching.sql ← 杜立特救命恩人、麦克阿瑟重返、卡巴那端游骑兵营救、印第安纳波利斯幸存者、小狗 Smoky、V-J Day
```

**感人、有趣·日军视角：**
```
supabase_seed_pacific_events_touching_japanese.sql   ← 栗林忠道硫磺岛家书、特攻隊員の遺書
supabase_seed_pacific_stories_touching_japanese.sql  ← 栗林给女儿的信、特攻队员遗书「不要哭」、八月十五日聆听玉音放送的人们
```

## 绝对路径（便于复制到终端或「打开文件」）

见项目根目录下上述文件名。

## 执行前注意

1. 先执行 **supabase_pacific_theater_migration.sql**（为各表添加 `pacific` 战区）。
2. 再按上表顺序执行基础种子四个文件。
3. 若需详情页显示参战单位、时间线、图片，再执行 battle_detail、battle_timeline、battle_images 三个种子（且需已执行过 supabase_battle_detail_migration.sql、supabase_battle_timeline_migration.sql、supabase_battle_images_migration.sql）。
4. 扩展种子在基础种子与详情/时间线/图片之后执行；扩展会为珊瑚海、莱特湾、硫磺岛、冲绳等补充详情、时间线、图片、事件、地标与故事。

## 若仍无法在侧边栏看到

- 检查左侧是否选中了正确的**工作区根目录**（World War Archives）。
- 若只打开了子文件夹，用 **File → Open Folder** 打开 `World War Archives` 整个项目。
- 在终端中打开：  
  `cd "/Users/limao/2026/World War Archives"`  
  然后 `open supabase_seed_pacific_campaign.sql`（用系统默认应用打开）。

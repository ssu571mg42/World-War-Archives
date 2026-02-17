# 西欧战场：已有事件与可补充知识点

## 一、已有事件（种子数据中）

按**时间顺序**与**种子文件**归类，便于对照与扩展。

### 1940 年（法国陷落、不列颠之战）

| 日期 / 名称（英） | 中文名 | 种子文件 | event_kind |
|-------------------|--------|----------|------------|
| 1940-05-24 German Halt Order (Dunkirk) | 德军停止前进令（敦刻尔克） | expansion | battle_event |
| 1940-06-04 Churchill "We shall fight on the beaches" | 丘吉尔「我们将在海滩战斗」 | main | other |
| 1940-06-18 Churchill "Finest Hour" | 丘吉尔「最光辉时刻」 | expansion | other |
| 1940-09-15 Battle of Britain Day | 不列颠之战日 | main | battle_event |

### 1944 年（诺曼底、市场花园、阿登、南法）

| 日期 / 名称（英） | 中文名 | 种子文件 | event_kind |
|-------------------|--------|----------|------------|
| 1944-05-01 Operation Fortitude and the Ghost Army | 坚毅行动与「幽灵军团」 | touching_stories | other |
| 1944-06-05 Eisenhower's "In Case of Failure" Note | 艾森豪威尔的「失败责任」便条 | touching_stories | other |
| 1944-06-06 D-Day Normandy Landings | D-Day 诺曼底登陆日 | main | battle_event |
| 1944-06-20 French Villages Welcome Their Liberators | 法国村庄欢迎解放者 | touching_stories | other |
| 1944-08-15 Operation Dragoon D-Day | 龙骑兵登陆日 | southern_france | battle_event |
| 1944-09-04 Liberation of Antwerp and Brussels | 安特卫普与布鲁塞尔解放 | expansion | battle_event |
| 1944-09-12 Link-up Southern France and Normandy Forces | 南法盟军与诺曼底部队会师 | southern_france | battle_event |
| 1944-12-15 Disappearance of Glenn Miller | 格伦·米勒失踪 | touching_stories | other |
| 1944-12-17 Malmedy Massacre | 马尔梅迪屠杀 | main | battle_event |
| 1944-12-25 Christmas at Bastogne | 巴斯托涅的圣诞节 | touching_stories | other |
| 1944-12-26 Patton Relief of Bastogne | 巴顿解围巴斯托涅 | expansion | battle_event |

**德军视角（轴心）事件（expansion / axis 中按战役关联）：**

| 名称（英） | 中文名 | 种子文件 |
|------------|--------|----------|
| Rommel and the Atlantic Wall | 隆美尔与西线「大西洋壁垒」 | axis_perspective |
| Decision for the Ardennes Offensive | 阿登反击决策 | axis_perspective |
| Loss of the Ludendorff Bridge at Remagen | 雷马根大桥失守 | axis_perspective |
| Model and the Ruhr Pocket | 莫德尔与鲁尔包围 | axis_perspective |
| German Surrender in the West and Dönitz | 西线德军投降与邓尼茨政府 | axis_perspective |

### 1945 年

| 日期 / 名称（英） | 中文名 | 种子文件 | event_kind |
|-------------------|--------|----------|------------|
| 1945-03-07 (事件为雷马根失守，见上) | — | axis_perspective | battle_event |
| 1945-04-25 Elbe Day (US-Soviet Link-up) | 易北河会师 | expansion | battle_event |
| 1945-05-08 V-E Day | 欧洲胜利日 | main | other |

---

## 二、可补充的事件与知识点

以下均为史实上重要、且目前种子中**尚未**单独做成事件的内容，可按需加入 `events` 表（或作「知识点」展示）。

### 1940

- **法国停战 / 贡比涅车厢**（1940-06-22）：法德停战签署于贡比涅森林同一节车厢，希特勒刻意羞辱法国。
- **敦刻尔克撤退完成**（1940-06-04）：「发电机」行动结束，约 33.8 万人撤至英国。
- **丘吉尔「 Never in the field of human conflict」**（1940-08-20 前后）：不列颠之战期间在下院赞扬 RAF 的著名演说。

### 1942

- **迪耶普奇袭**（1942-08-19）：已有 battle，可加一条「事件」强调教训对 D-Day 的贡献。

### 1944（诺曼底与突破）

- **瑟堡陷落**（1944-06-26/27）：美军攻占诺曼底主要港口，改善补给。
- **眼镜蛇行动开始**（1944-07-25）：盟军从圣洛方向突破，打破僵局。
- **法莱斯包围圈封闭**（1944-08-21 前后）：波军扼守蒙蒂潘，缺口闭合。
- **巴黎起义与解放**（1944-08-19–25）：已有 battle「Liberation of Paris」，可加事件「巴黎起义开始」或「肖尔蒂茨拒绝烧毁巴黎」。
- **市场花园开始 / 阿纳姆空降**（1944-09-17）：已有战役与战斗，可加「市场花园首日」类事件。
- **斯海尔德河 / 瓦尔赫伦**（1944-10–11）：已有 battle，可加「安特卫普港开放」或「瓦尔赫伦登陆」事件。

### 1944（阿登与年末）

- **「Nuts!」回复**（1944-12-22）：麦考利夫对德军劝降的著名回复，可作独立事件或与巴斯托涅圣诞并列。
- **突出部之役开始**（1944-12-16）：德军发动「守望莱茵」攻势。

### 1945

- **兰斯投降签字**（1945-05-07）：约德尔在兰斯签署投降书，可与 axis 中的「邓尼茨/西线投降」事件互补。
- **达豪解放**（1945-04-29）：美军解放达豪集中营，常归入西线/中欧叙事。
- **荷兰「饥饿冬天」结束**（1945-05 初）：盟军与加拿大军进入荷兰，救济开始。
- **贝尔根-贝尔森解放**（1945-04-15）：英军解放，可与西线「解放与暴行」叙事并列。

### 文化 / 政治 / 其他

- **诺曼底登陆前夜艾森豪威尔对空降兵的讲话**：与「失败责任」便条同一天，可作同一主题的补充。
- **「最漫长的一天」**：6 月 6 日 D-Day 的俗称，可在摘要或展示文案中体现。
- **肖尔蒂茨拒绝烧毁巴黎**：巴黎解放中的关键决定，可单独一条事件。

---

## 三、种子文件与执行顺序

1. `supabase_seed_western_europe.sql` — 主战役、战斗、事件、纪念处、故事  
2. `supabase_seed_western_europe_southern_france.sql` — 南法  
3. `supabase_seed_western_europe_expansion.sql` — 圣洛、莫尔坦、许特根、斯海尔德、鲁尔、科隆等  
4. `supabase_seed_western_europe_axis_perspective.sql` — 德军视角事件与故事  
5. `supabase_seed_western_europe_touching_stories.sql` — 感人·有趣事件与故事  
6. `supabase_seed_omaha_detail.sql` — 奥马哈详情（battle_units、battle_timeline_events）

如需把「可补充」中的某几条做成正式 `events` 插入语句，可指定事件名称或日期，我可以按现有格式写出 SQL。

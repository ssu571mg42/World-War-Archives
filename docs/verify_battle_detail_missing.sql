-- =============================================================================
-- 战役详情缺失验证统计（第二轮扫描配套）
-- 在 Supabase SQL Editor 中执行，跑齐所有种子与补全脚本后使用。
-- 用于核对《战役详情数据缺失扫描报告》中的「仍缺失」数量与分布。
-- =============================================================================

-- 按战役统计：单位数、无 unit_id 数、子单位无人数/无伤亡数、装备无 quantity_lost 数
SELECT
  b.name_en,
  COUNT(DISTINCT bu.id) AS units,
  COUNT(DISTINCT bu.id) FILTER (WHERE bu.unit_id IS NULL) AS no_unit_id,
  COUNT(DISTINCT bu.id) FILTER (WHERE bu.personnel_count IS NULL AND bu.parent_unit_id IS NOT NULL) AS child_no_count,
  COUNT(DISTINCT bu.id) FILTER (WHERE bu.personnel_killed IS NULL AND bu.personnel_wounded IS NULL AND bu.parent_unit_id IS NOT NULL) AS child_no_casualties,
  (SELECT COUNT(*) FROM battle_unit_equipment e JOIN battle_units u ON e.battle_unit_id = u.id WHERE u.battle_id = b.id AND e.quantity_lost IS NULL) AS equip_no_lost
FROM battles b
LEFT JOIN battle_units bu ON bu.battle_id = b.id
WHERE b.campaign_id IN (SELECT id FROM campaigns WHERE name_en IN ('North African Campaign', 'Madagascar Campaign'))
   OR b.name_en IN ('Battle of Dakar', 'Battle of Keren', 'Battle of Gabon', 'Tunisia Campaign')
GROUP BY b.id, b.name_en
ORDER BY b.name_en;

-- 可选：检查是否有战役缺少时间线或图片
SELECT b.name_en,
  (SELECT COUNT(*) FROM battle_timeline_events t WHERE t.battle_id = b.id) AS timeline_events,
  (SELECT COUNT(*) FROM battle_images i WHERE i.battle_id = b.id) AS images
FROM battles b
WHERE b.campaign_id IN (SELECT id FROM campaigns WHERE name_en IN ('North African Campaign', 'Madagascar Campaign'))
   OR b.name_en IN ('Battle of Dakar', 'Battle of Keren', 'Battle of Gabon', 'Tunisia Campaign')
ORDER BY b.name_en;

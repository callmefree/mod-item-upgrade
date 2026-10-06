-- ---------------------------------------------------------------------------
-- mod-item-upgrade : power token drops from raid end-bosses (world DB base)
--
-- Adds the five power tokens (801050-801054) as direct boss drops so that
-- players can reach rank 4-20 (ranks 1-3 only cost gold, already working).
-- Applied as base world data; mirrors the live change in azcore_ci_world. Idempotent (DELETE+INSERT).
--
-- Tiers (per server design: high-end raid end-bosses only, mid chances,
--        tiered by instance difficulty):
--   Tier A (early/mid raids)  -> Shard (801050) + Fragment (801051)  [rank 4-11]
--   Tier B (top raids)        -> Core (801052) + Gem (801053) + Crown (801054) [rank 12-20]
--
-- Chances: Shard 35%, Fragment 30%, Core 30%, Gem 25%, Crown 15%.
-- MinCount = MaxCount = 1.
--
-- Idempotent: DELETE first, then INSERT. Safe to re-run.
-- ---------------------------------------------------------------------------

SET NAMES utf8mb4;

-- === Tier A bosses : Shard (801050) + Fragment (801051) ====================
DELETE FROM `creature_loot_template`
WHERE `Entry` IN (
  15956,15953,15954,16061,16028,15931,15932,15936,16011,15952,15989,15990,16060,  -- Naxxramas
  33113,33118,33186,32867,32857,32927,33288,33293,33515,33271,                     -- Ulduar
  10184,                                                                          -- Onyxia
  28860                                                                           -- Sartharion
)
AND `Item` IN (801050,801051);

INSERT INTO `creature_loot_template`
  (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
VALUES
  -- Shard of Power (35%)
  (15956,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (15953,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (15954,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (16061,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (16028,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (15931,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (15932,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (15936,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (16011,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (15952,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (15989,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (15990,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (16060,801050,0,35,0,1,0,1,1,'Naxxramas - Shard of Power'),
  (33113,801050,0,35,0,1,0,1,1,'Ulduar - Shard of Power'),
  (33118,801050,0,35,0,1,0,1,1,'Ulduar - Shard of Power'),
  (33186,801050,0,35,0,1,0,1,1,'Ulduar - Shard of Power'),
  (32867,801050,0,35,0,1,0,1,1,'Ulduar - Shard of Power'),
  (32857,801050,0,35,0,1,0,1,1,'Ulduar - Shard of Power'),
  (32927,801050,0,35,0,1,0,1,1,'Ulduar - Shard of Power'),
  (33288,801050,0,35,0,1,0,1,1,'Ulduar - Shard of Power'),
  (33293,801050,0,35,0,1,0,1,1,'Ulduar - Shard of Power'),
  (33515,801050,0,35,0,1,0,1,1,'Ulduar - Shard of Power'),
  (33271,801050,0,35,0,1,0,1,1,'Ulduar - Shard of Power'),
  (10184,801050,0,35,0,1,0,1,1,'Onyxia - Shard of Power'),
  (28860,801050,0,35,0,1,0,1,1,'Sartharion - Shard of Power'),
  -- Fragment of Power (30%)
  (15956,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (15953,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (15954,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (16061,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (16028,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (15931,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (15932,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (15936,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (16011,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (15952,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (15989,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (15990,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (16060,801051,0,30,0,1,0,1,1,'Naxxramas - Fragment of Power'),
  (33113,801051,0,30,0,1,0,1,1,'Ulduar - Fragment of Power'),
  (33118,801051,0,30,0,1,0,1,1,'Ulduar - Fragment of Power'),
  (33186,801051,0,30,0,1,0,1,1,'Ulduar - Fragment of Power'),
  (32867,801051,0,30,0,1,0,1,1,'Ulduar - Fragment of Power'),
  (32857,801051,0,30,0,1,0,1,1,'Ulduar - Fragment of Power'),
  (32927,801051,0,30,0,1,0,1,1,'Ulduar - Fragment of Power'),
  (33288,801051,0,30,0,1,0,1,1,'Ulduar - Fragment of Power'),
  (33293,801051,0,30,0,1,0,1,1,'Ulduar - Fragment of Power'),
  (33515,801051,0,30,0,1,0,1,1,'Ulduar - Fragment of Power'),
  (33271,801051,0,30,0,1,0,1,1,'Ulduar - Fragment of Power'),
  (10184,801051,0,30,0,1,0,1,1,'Onyxia - Fragment of Power'),
  (28860,801051,0,30,0,1,0,1,1,'Sartharion - Fragment of Power');

-- === Tier B bosses : Core (801052) + Gem (801053) + Crown (801054) =========
DELETE FROM `creature_loot_template`
WHERE `Entry` IN (
  34797,34780,34796,34564,          -- Trial of the Crusader
  36612,36855,36678,36627,36626,37970,36597,36853,37934,37813,  -- Icecrown Citadel
  39863                            -- Ruby Sanctum
)
AND `Item` IN (801052,801053,801054);

INSERT INTO `creature_loot_template`
  (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`)
VALUES
  -- Core of Power (30%)
  (34797,801052,0,30,0,1,0,1,1,'ToC - Core of Power'),
  (34780,801052,0,30,0,1,0,1,1,'ToC - Core of Power'),
  (34796,801052,0,30,0,1,0,1,1,'ToC - Core of Power'),
  (34564,801052,0,30,0,1,0,1,1,'ToC - Core of Power'),
  (36612,801052,0,30,0,1,0,1,1,'ICC - Core of Power'),
  (36855,801052,0,30,0,1,0,1,1,'ICC - Core of Power'),
  (36678,801052,0,30,0,1,0,1,1,'ICC - Core of Power'),
  (36627,801052,0,30,0,1,0,1,1,'ICC - Core of Power'),
  (36626,801052,0,30,0,1,0,1,1,'ICC - Core of Power'),
  (37970,801052,0,30,0,1,0,1,1,'ICC - Core of Power'),
  (36597,801052,0,30,0,1,0,1,1,'ICC - Core of Power'),
  (36853,801052,0,30,0,1,0,1,1,'ICC - Core of Power'),
  (37934,801052,0,30,0,1,0,1,1,'ICC - Core of Power'),
  (37813,801052,0,30,0,1,0,1,1,'ICC - Core of Power'),
  (39863,801052,0,30,0,1,0,1,1,'RS - Core of Power'),
  -- Gem of Power (25%)
  (34797,801053,0,25,0,1,0,1,1,'ToC - Gem of Power'),
  (34780,801053,0,25,0,1,0,1,1,'ToC - Gem of Power'),
  (34796,801053,0,25,0,1,0,1,1,'ToC - Gem of Power'),
  (34564,801053,0,25,0,1,0,1,1,'ToC - Gem of Power'),
  (36612,801053,0,25,0,1,0,1,1,'ICC - Gem of Power'),
  (36855,801053,0,25,0,1,0,1,1,'ICC - Gem of Power'),
  (36678,801053,0,25,0,1,0,1,1,'ICC - Gem of Power'),
  (36627,801053,0,25,0,1,0,1,1,'ICC - Gem of Power'),
  (36626,801053,0,25,0,1,0,1,1,'ICC - Gem of Power'),
  (37970,801053,0,25,0,1,0,1,1,'ICC - Gem of Power'),
  (36597,801053,0,25,0,1,0,1,1,'ICC - Gem of Power'),
  (36853,801053,0,25,0,1,0,1,1,'ICC - Gem of Power'),
  (37934,801053,0,25,0,1,0,1,1,'ICC - Gem of Power'),
  (37813,801053,0,25,0,1,0,1,1,'ICC - Gem of Power'),
  (39863,801053,0,25,0,1,0,1,1,'RS - Gem of Power'),
  -- Crown of Power (15%, top-end rank 20)
  (34797,801054,0,15,0,1,0,1,1,'ToC - Crown of Power'),
  (34780,801054,0,15,0,1,0,1,1,'ToC - Crown of Power'),
  (34796,801054,0,15,0,1,0,1,1,'ToC - Crown of Power'),
  (34564,801054,0,15,0,1,0,1,1,'ToC - Crown of Power'),
  (36612,801054,0,15,0,1,0,1,1,'ICC - Crown of Power'),
  (36855,801054,0,15,0,1,0,1,1,'ICC - Crown of Power'),
  (36678,801054,0,15,0,1,0,1,1,'ICC - Crown of Power'),
  (36627,801054,0,15,0,1,0,1,1,'ICC - Crown of Power'),
  (36626,801054,0,15,0,1,0,1,1,'ICC - Crown of Power'),
  (37970,801054,0,15,0,1,0,1,1,'ICC - Crown of Power'),
  (36597,801054,0,15,0,1,0,1,1,'ICC - Crown of Power'),
  (36853,801054,0,15,0,1,0,1,1,'ICC - Crown of Power'),
  (37934,801054,0,15,0,1,0,1,1,'ICC - Crown of Power'),
  (37813,801054,0,15,0,1,0,1,1,'ICC - Crown of Power'),
  (39863,801054,0,15,0,1,0,1,1,'RS - Crown of Power');


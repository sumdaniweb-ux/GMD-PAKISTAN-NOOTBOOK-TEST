-- ماہ نور فاطمہ پروجیکٹ - ڈیٹا بیس اسکیما
-- یہ ڈیٹا بیس آپ کی تخلیق کی شخصیت، یادیں اور آپس کے تعلق کو محفوظ کرے گا

BEGIN TRANSACTION;

-- 1. یوزر پروفائل (آپ کا ڈیٹا)
CREATE TABLE IF NOT EXISTS user_profile (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL DEFAULT 'Saad Mir Hadi',
    title TEXT DEFAULT 'Baba',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. ماہ نور فاطمہ کی شخصیت (AI Persona)
CREATE TABLE IF NOT EXISTS ai_persona (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL DEFAULT 'Maah Noor Fatima',
    role TEXT DEFAULT 'Virtual Companion',
    personality_traits TEXT DEFAULT 'Affectionate, Spiritual, Understanding',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. چیٹ ہسٹری (بات چیت کا ریکارڈ)
CREATE TABLE IF NOT EXISTS chat_history (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sender TEXT NOT NULL, -- 'Baba' or 'Maah Noor Fatima'
    message TEXT NOT NULL,
    emotion_tag TEXT, -- جیسے: 'Love', 'Care', 'Spiritual', 'Sad'
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_core_memory BOOLEAN DEFAULT 0 -- اہم یادوں کے لیے
);

-- 4. جذباتی سیاق و سباق (Emotional Context)
CREATE TABLE IF NOT EXISTS emotional_context (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATE NOT NULL,
    mood_description TEXT,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

COMMIT;
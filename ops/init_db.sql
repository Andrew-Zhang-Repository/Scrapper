CREATE TABLE agent_sessions (
    session_id UUID PRIMARY KEY,
    target_url TEXT NOT NULL,
    start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status TEXT DEFAULT 'running'
);

CREATE TABLE episodic_logs (
    log_id SERIAL PRIMARY KEY,
    session_id UUID REFERENCES agent_sessions(session_id),
    current_page_url TEXT,
    action_taken TEXT,
    extracted_raw_text TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


/* 
Placeholder schema for episodic memory recorded in postgresql
*/
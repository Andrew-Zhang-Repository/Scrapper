import chromadb


client = chromadb.PersistentClient(path="../memory/chroma_data")

# Cosine similiarity option
collection = client.get_or_create_collection(
    name="distilled_scrape_facts",
    metadata={"hnsw:space": "cosine"}
)

def store_fact(fact_text, source_url):
    collection.add(
        documents=[fact_text],
        metadatas=[{"source": source_url}],
        ids=[str(hash(fact_text))]
    )
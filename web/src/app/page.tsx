import { Button } from "@/components/ui/button"

export default function Home() {
  return (
    <main className="flex flex-1 flex-col items-center justify-center gap-10 px-6 py-24">
      <div className="flex flex-col items-center gap-4 text-center">
        <span className="rounded-full border border-border bg-muted px-3 py-1 text-xs font-medium tracking-wide text-muted-foreground uppercase">
          Foundations
        </span>
        <h1 className="text-4xl font-semibold tracking-tight">Nodus</h1>
        <p className="max-w-md text-balance text-muted-foreground">
          A retrieval-augmented knowledge engine. Ingest documents, embed them
          into pgvector, and answer questions with citations.
        </p>
      </div>

      <div className="flex flex-wrap items-center justify-center gap-3">
        <Button>Get started</Button>
        <Button variant="outline">Read the docs</Button>
      </div>
    </main>
  )
}

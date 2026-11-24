# TokenGuard API

An enterprise-grade **AI API Gateway, Usage Metering, and Atomic Credit Ledger** built with Go. Designed to prevent runaway AI agent costs, enforce per-key rate limits, and guarantee zero-overdraft credit deductions under high concurrency.

## Key Engineering Highlights

- **Atomic Credit Ledger:** Prevents race conditions and negative balances during concurrent AI agent bursts using database row-level locking (`SELECT ... FOR UPDATE`).
- **Idempotent Top-Ups:** Ensures duplicate network retries never double-credit user wallets via `Idempotency-Key` enforcement.
- **Distributed Rate Limiting:** Protects upstream LLM providers using Redis-backed rate limiting per virtual API key.
- **Non-Blocking Telemetry:** Offloads usage analytics logging to asynchronous worker pools via Go channels with graceful shutdown support.
- **Clean Architecture:** Strict separation of concerns across `domain`, `usecase`, `repository`, and `delivery` layers.

## Tech Stack

- **Language:** Go 1.27+
- **Database:** PostgreSQL 17
- **Cache & Rate Limiting:** Redis 7
- **Infrastructure:** Docker & Docker Compose

## Project Structure

```text
├── cmd/api/            # Application entrypoint & dependency wiring
├── internal/
│   ├── domain/         # Core entities, custom errors & repository interfaces
│   ├── usecase/        # Business logic & transaction orchestration
│   ├── repository/     # PostgreSQL & Redis implementations
│   └── delivery/       # HTTP handlers, routing & middlewares
├── docker-compose.yml  # Local infrastructure setup
└── Makefile            # Common development & testing commands
```

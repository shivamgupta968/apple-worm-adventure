# Apple Worm Adventure — VELoop Full Stack Task

Original grid puzzle game with 50 generated levels, React frontend, Express API, auth, progress, wallet, reward ledger, configurable economy, and mock rewarded-ad flow.

## Stack
- React + Vite (client)
- Node.js + Express (server)
- JWT + bcryptjs authentication
- JSON persistence for easy local setup (server/data/db.json); adapter-ready structure. Set MongoDB URI only if you extend storage to Mongo.
- Rewarded ads are **DEMO MOCKS**; no real ad network SDK/SSV integration is included.

## Local setup
Requirements: Node.js 18+ and npm.

### Terminal 1 — backend
```powershell
cd server
npm install
copy .env.example .env
npm run dev
```
API: http://localhost:5000/api and health: http://localhost:5000/api/health

### Terminal 2 — frontend
```powershell
cd client
npm install
copy .env.example .env
npm run dev
```
Open the Vite URL printed (normally http://localhost:5173).

**Windows quick start:** run `START-WINDOWS.bat` from project root; it installs packages and opens both servers in separate windows.

## Environment
`client/.env`: `VITE_GAME_NAME`, `VITE_API_URL`.
`server/.env`: `GAME_NAME`, `PORT`, `JWT_SECRET`, `CLIENT_ORIGIN`.
Change game name in env, restart/rebuild. UI uses one centralized `GAME_NAME`.

## Implemented features
- Grid puzzle, keyboard arrows/WASD, touch direction pad
- Apple collection and growth; worm body collision; hazards; portal requires objective
- 50 levels with level unlocks, move tracking, score, stars, restart, undo, hint
- Responsive home/dashboard, level selection, game board, completion/failure overlays
- Demo account registration/login; progress persisted on server
- Wallet balance and ledger; level coins, reward transactions, hint spend
- Reward opportunity flow for REVIVE, DOUBLE_SCORE, DOUBLE_COINS, EXTRA_MOVES, HINT, BOOSTER
- Mock ad session with server-side state, one-time grant, caps/cooldown and idempotency key
- Leaderboard, achievements, admin economy screen (demo admin: `admin@appleworm.test` / `Admin123!`)
- Sound effects + music toggle (browser-generated sound; no external audio assets)
- README, architecture, env examples, ignore rules

## Economy / ad safety
Mock rewarded flow explicitly labels itself simulated. Backend creates opportunity, requires a completed mock-provider step, then grants reward once. Configurable per-day limits, per-session cap, cooldown, and ledger. This is a local demo architecture, **not a real ad verification integration**. Before production, integrate an ad provider with signed server-side callbacks/SSV and add MongoDB persistence, secure cookie/token refresh, rate limiting, production admin authorization, and deploy environment configuration.

## API
- `POST /api/auth/register`, `/login`, `/logout`, `GET /auth/me`
- `GET /dashboard`, `GET /levels`, `POST /games/start`, `POST /games/complete`
- `GET /wallet`, `GET /wallet/ledger`, `POST /wallet/spend`
- `POST /rewards/opportunity`, `POST /rewards/mock-complete`, `POST /rewards/claim`
- `GET /leaderboard`, `GET /achievements`
- `GET/PUT /admin/economy` (admin only)

## Demo admin
Email: `admin@appleworm.test`
Password: `Admin123!`
Admin account is seeded on first server start.

## Submission checklist
- [ ] Reference game reviewed and design notes recorded
- [ ] Run locally and test levels 1–5 and later levels
- [ ] Real MongoDB persistence adapter added if required by evaluator
- [ ] Real ad network integration + SSV added (currently mocked)
- [ ] Deploy frontend/backend; set environment variables; verify CORS
- [ ] Record demo showing game, wallet, reward flow, leaderboard, admin
- [ ] Add GitHub repo URL and live URLs to submission

## Limitations
- Generated level layouts are deterministic prototypes; manually playtest/tune all 50.
- Demo ads are mock events, not actual ad impressions.
- JSON store is suitable for local demo only, not production multi-instance use.

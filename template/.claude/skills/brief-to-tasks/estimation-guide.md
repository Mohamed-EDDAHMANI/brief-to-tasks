# Estimation guide

Rough ranges for one mid-level developer who knows the stack. They include writing basic tests. They leave out design, deployment, code review, client feedback and meetings.

**These are rules of thumb from general experience, not measured data.** Adjust them with your own history. When the guide and the real code disagree, trust the code.

## Common tasks

| Task | Range |
|---|---|
| Form with validation | 2 to 4 h |
| One REST resource (create, read, update, delete) with tests | 3 to 6 h |
| Database model and migration | 1 to 3 h |
| Login and sign-up from scratch (sessions or tokens) | 8 to 16 h |
| Login with a provider (Auth0, Clerk, Firebase) | 3 to 6 h |
| Roles and permission checks | 3 to 8 h |
| File upload to storage, with checks | 4 to 8 h |
| One transactional email with a template | 3 to 6 h |
| Payments (checkout and webhook) | 10 to 24 h |
| Real-time updates (WebSocket or SSE) | 8 to 16 h |
| Basic search in the database | 3 to 6 h |
| Search with a search engine | 10 to 20 h |
| Interactive calendar screen | 10 to 18 h |
| Basic admin panel | 12 to 24 h |
| Dark mode | 4 to 10 h |
| Background jobs or scheduled tasks | 6 to 12 h |
| Third-party API, well documented | 4 to 10 h |
| Third-party API, poorly documented | 10 to 24 h |
| One mobile screen (cross-platform) | 4 to 8 h |
| Store release for iOS and Android | 8 to 20 h, plus the store's review time |
| Basic deployment and CI | 4 to 10 h |
| Bug with an unknown cause | 1 to 8 h |

## Multipliers
Apply to the whole range, and say which one you applied.

| Situation | Multiply by |
|---|---|
| The developer does not know the stack | 1.5 to 2 |
| Old code with no tests | 1.3 to 2 |
| The requirements are still unclear | 1.3 |
| Client feedback rounds (freelance work) | add 15 to 30% |
| Junior developer | 1.5 |

## Days
Count about 6 productive hours per day for one person. Do not assume 8.

## Often forgotten
Error states, empty states, loading states, permissions, data migration, environment setup, and reading the existing code. List the ones that apply as tasks or as "left out".

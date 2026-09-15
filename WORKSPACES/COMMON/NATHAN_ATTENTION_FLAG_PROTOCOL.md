# Nathan Attention Flag Protocol

**Status:** ACTIVE — Nathan directive, 2026-09-14

## Symbol

`🔶` means there is a genuinely unresolved item that requires Nathan's attention, action, answer, or manual intervention.

## Sticky behavior

Once any current worker raises a `🔶` item, the flag remains **sticky** in that worker's subsequent user-facing messages until one of the following occurs:

1. Nathan answers or performs the requested action;
2. the worker obtains the needed information/action by another legitimate route;
3. Sable determines, with recorded reason, that the dependency no longer matters or has been superseded.

Do not silently drop the symbol merely because the next message concerns a different topic.

## Threshold

Do **not** raise `🔶` for:
- optional niceties;
- work that can proceed safely without Nathan;
- old to-dos that are not currently blocking or clearly high-leverage;
- tasks the worker can reasonably route, automate, defer, or solve independently.

Raise it when Nathan's attention is materially useful or necessary — for example a manual launch, an unavailable local action, a decision only Nathan can make, or a genuine blocker.

When practical, state the unresolved item concisely in the message rather than using an unexplained flag.

## Sable oversight

Sable tracks open Nathan-attention items across workers and may consolidate, retire, or reroute them when justified. A worker should notify Sable when opening or closing a sticky attention item.

The existing `🔶 only for genuine Nathan-required items` rule remains in force; this file adds persistence until resolution.

# pj-blackmarket

Velkommen til `pj-blackmarket` - en ressource til FiveM/RedM, der skaber et sort marked.

## Beskrivelse

Denne ressource gør det muligt at oprette et sort marked i spillet, så spillere kan købe forskellige genstande fra en sort markedshandler. Den har et brugergrænseflade (UI) til interaktion.

## Funktioner

- Sort marked UI med forskellige kategorier (Alle, Rustning, Våben osv.).
- Pederstrian (ped), der fungerer som sort markedssælger.
- Integration med ESX til styring af spillerkonti.

## Installation

1. Download `pj-blackmarket`-ressourcen.
2. Placer ressourcen i din FiveM/RedM-servers ressourcemappe.
3. Sørg for, at ressourcen er korrekt konfigureret i din server.cfg-fil.

## Konfiguration

### Config.lua

- `MarketPed`: Ped-modellen til sort markedssælgeren.
- `randomLocation`: Koordinater og retning for det tilfældige sted for sort marked.
- `Items`: Konfiguration for de genstande, der er tilgængelige på det sorte marked.

### Webhook-konfiguration

Opdater `WebhookLink` i serversiden til den ønskede Discord-webhook til logging.

## Brug

1. Spillere kan interagere med det sorte marked ved at nærme sig peden eller bruge en angivet tast.
2. Det sorte marked UI viser tilgængelige genstande, priser og kategorier.
3. Spillere kan foretage køb gennem UI'en.

## NUI Callbacks

- `item`: Håndterer køb af genstande fra det sorte marked UI.

## Notifikationer

Spillere modtager notifikationer om vellykkede køb, utilstrækkelige midler og andre relevante begivenheder.

## Bidrag

Hvis du gerne vil bidrage til dette projekt, er du velkommen til at sende pull requests.

## Licens

Dette projekt er licenseret under MIT-licensen - se [LICENSE](LICENSE)-filen for detaljer.

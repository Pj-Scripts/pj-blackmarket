# pj-blackmarket

Velkommen til `pj-blackmarket` - en ressource til FiveM, der tilfører din FiveM-server et unikt BlackMarket Script.

## Beskrivelse

Denne ressource muliggør en unik spilleroplevelse med blackmarket på din FiveM-server, hvor spillere kan købe forskellige genstande fra en sort markedshandler. Det inkluderer et brugergrænseflade (UI) for interaktion.

## Funktioner

- Sort marked UI præsenteret som en tablet.
- En pederstrian (ped), der fungerer som sort markedssælger.
- Integration med ESX for styring af spillerkonti.

## Installation

1. Download `pj-blackmarket`-ressourcen.
2. Placer ressourcen i din FiveM-servermappe for ressourcer.
3. Kontroller, at ressourcen er korrekt konfigureret i din server.cfg-fil.


## Custom UI
1. Clone dette repository eller download det som en zip-fil.
2. Udpak zip-filen (hvis du har downloadet den som en zip-fil).
3. Flyt mappen `pj-blackmarket` til din resources-mappe.
4. Tilføj `ensure pj-blackmarket` til din server.cfg.
5. Opdater ui_page url i fxmanifest.lua til din url.
6. Rediger config.lua efter dine præferencer.
7. Start din server.

## Konfiguration

### Config.lua

- `MarketPed`: Ped-modellen til sort markedssælgeren.
- `randomLocation`: Koordinater og retning for det tilfældige sted for sort marked.
- `Items`: Konfiguration for de genstande, der er tilgængelige på det sorte marked.

### Webhook-konfiguration

Opdater `WebhookLink` i serversiden med den ønskede Discord-webhook til logging.

## Brug

1. Spillere kan interagere med det sorte marked ved at nærme sig peden eller bruge en angiven tast.
2. Det sorte marked UI viser tilgængelige genstande, priser og kategorier.
3. Spillere kan foretage køb gennem UI'en.

## Notifikationer

Spillere modtager notifikationer om vellykkede køb, utilstrækkelige midler og andre relevante begivenheder.

## Bidrag

Hvis du ønsker at bidrage til dette projekt, er du velkommen til at sende pull requests.

## Licens

Dette projekt er licenseret under MIT-licensen - se [LICENSE](LICENSE)-filen for detaljer.

# Über dieses Projekt
Das Ziel ist es, dass ihr euren eigenen Platformer (à la Mario Bros.) erstellt. Das wirkt zunächst, wie eine gigantische Aufgabe, aber mit dem was ihr bereits wisst und indem wir einige Schritte gemeinsam besprechen, wird das gar nicht so schwer.

# Hinweis
Grundlegend ist diese letzte Sektion nach dem fantastischen "Godot Beginner Tutorial" vom dänischen YouTube Kanal "Brackeys" aufgebaut. Solange Englisch kein Problem ist, würde ich dieses Video sehr empfehlen: https://www.youtube.com/watch?v=LOhfqjmasi0

# Aufgabenschritte
1. Spieler-Kontroller (gemeinsam) (26.02)
  - Bewegen
  - Springen (und nicht unendlich)
2. einfache Umgebung (gemeinsam)

# Erklärung
## 1. Spieler-Kontroller
### der Spieler
- Erstellt ein neues Godot-Projekt
- Erstellt eine Hauptszene (e.g. "main")
- Erstellt eine weitere Character-Body-2D-Szene (nennt sie e.g. "player")
- Fügt dieser eine Animated-Sprite-2D-Node
- unter dem Punkt "Spriter-Frames" erstellt einen Neuen
- Ein Animations-Fenster sollte sich öffnen
- Wählt den Knopf mit dem Raster und fügt Spriter von einem heruntergeladenen (oder selbst gemachten) Sprite-Sheet hinzu (siehe Quellen für Links)
>[!WARNING]
> Falls es sich um Pixel Art handelt, geht unter `Project>Project Settings>General>Rendering>Textures>Default Texture Filter` und stellt ihn auf `Nearest`
- Fügt einen CollisionShape hinzu (dieser sollte kleiner sein als der Spieler)
### Hauptszene
- Fügt die eben erstellte Player-Szene in die Hauptszene ein
- Fügt zudem eine Kamera ein (und zoomt etwas heran)
- Fügt nun eine Weltgrenze hinzu, indem ihr eine `StaticBody2D-Node` und in diese einen `CollisionShape2D` mit der Form `WorldBoundary` hinzufügt
### Bewegung
- Nun muss sich der Spieler noch bewegen
- drückt auf den Spieler in der Hauptszene und fügt ein Skript hinzu, wählt unter Vorlagen das Movement-Script aus
- Passt nun die Geschwindigkeits und Sprung Variablen an und ändert alle Begriffe die mit `ui` Anfangen zu eigenen ab, die ihr dann in der Input-Map anpasst.
## 2. Umgebung erstellen (mit Tilesets)
Das kommt in der nächsten Stunde (oder falls ihr wollt hier: https://youtu.be/LOhfqjmasi0?t=1017)

# Links zu kostenlosen Resourcen
https://kenney.nl
https://opengameart.org
>[!IMPORTANT]
> Achtet auf die Lizenz. CC0 bedeutet, keine Nennung ist nötig.
> Recherchiert bei allem Anderen, bevor ihr es veröffentlicht.

# Quellen
https://opengameart.org/content/classic-hero-and-baddies-pack
https://kenney.nl/assets/platformer-art-pixel-redux
https://www.youtube.com/watch?v=LOhfqjmasi0
# Über dieses Projekt
Das Ziel ist es, dass ihr euren eigenen Platformer (à la Mario Bros.) erstellt. Das wirkt zunächst, wie eine gigantische Aufgabe, aber mit dem was ihr bereits wisst und indem wir einige Schritte gemeinsam besprechen, wird das gar nicht so schwer.

# Hinweis
Grundlegend ist diese letzte Sektion nach dem fantastischen "Godot Beginner Tutorial" vom dänischen YouTube Kanal "Brackeys" aufgebaut. Solange Englisch kein Problem ist, würde ich dieses Video sehr empfehlen: https://www.youtube.com/watch?v=LOhfqjmasi0

# Aufgabenschritte
1. Spieler-Controller (gemeinsam) (26.02)
2. einfache Umgebung (gemeinsam) (05.03)
3. Eigene Sprites *Spieler und Umgebung* (gemeinsam) (12.03, 19.03)
4. Gegner, Game Over (gemeinsam)
5. Weitere Gegner, eigener Game Over Bildschrim

# Erklärung
## 0. Grundlegendes
- Erstelle ein neues Godot-Projekt
- Erstelle eine 2D-Root-Node (Hauptszene, e.g. "main")
## 1. Spieler-Controller
- Erstelle eine Character-Body-2D-Szene (nenne sie e.g. "player")
### Animated-Sprite
- Füge dieser eine Animated-Sprite-2D-Node
- unter dem Punkt `Sprite-Frames` erstelle einen Neuen (Pfeil nach unten)
- Drücke darauf; ein Animations-Fenster sollte sich öffnen
-  Wähle den Knopf mit dem Raster und fügt Sprites von einem heruntergeladenen (oder selbst gemachten) Sprite-Sheet hinzu (siehe [Quellen](#quellen) für Links)
>[!WARNING]
> Falls es sich um Pixel Art handelt, gehe unter `Project>Project Settings>General>Rendering>Textures>Default Texture Filter` und stellt ihn auf `Nearest`.
> Das verhindert, dass der Sprite durch "Texture-Smoothing" verschwommen aussieht.
- Füge einen `CollisionShape`(Hitbox) hinzu (dieses sollte etwas kleiner sein als der Spieler)
### Einfügen in Hauptszene (unser Spiel)
- Füge die eben erstellte Player-Szene in die Hauptszene ein
- Füge zudem eine Kamera-Node (`Camera2D`) ein und zoome mit dieser etwas heran, falls der Spieler zu klein sein sollte (im `Inspektor` rechts)
- Füge nun eine Weltgrenze hinzu, indem du eine `StaticBody2D-Node` und in diese einen `CollisionShape2D` mit der Form `WorldBoundary` hinzufügst (damit der Spieler nicht nach unten ins nichts fällt)
### Bewegung
- Nun muss sich der Spieler noch bewegen
- Drücke auf die Spieler-Szene in der Hauptszene und füge ein Skript hinzu (+ Symbol mit der Schriftrolle)
- Wähle den Kasten `Vorlage` oder `Template` aus. (Was das macht klären wir später)
- Passt nun die Geschwindigkeits und Sprung Variablen an, so wie es euch gefällt
- Erstellt zudem eine eigene Inputmap. Siehe [hier](https://github.com/Informatik-AG-MPG/script?tab=readme-ov-file#inputmap-erstellen) für eine Wiederholung.
## 2. Umgebung erstellen (mit Tilesets)
Das kommt in der nächsten Stunde (oder falls ihr wollt hier: https://youtu.be/LOhfqjmasi0?t=1017)

# Links zu kostenlosen Resourcen
Fantastisch für Hintergründe und Assets: https://kenney.nl <br>
Hat zudem auch Spieler- und Gegner-Sprites: https://opengameart.org
>[!IMPORTANT]
> Achtet auf die Lizenz. CC0 bedeutet, keine Nennung ist nötig.
> Recherchiert bei allem Anderen, bevor ihr es veröffentlicht.

# Quellen
https://opengameart.org/content/classic-hero-and-baddies-pack <br>
https://kenney.nl/assets/platformer-art-pixel-redux <br>
https://www.youtube.com/watch?v=LOhfqjmasi0
# Über dieses Projekt
Das Ziel ist es, dass ihr euren eigenen Platformer (à la Mario Bros.) erstellt. Das wirkt zunächst, wie eine gigantische Aufgabe, aber mit dem was ihr bereits wisst und indem wir einige Schritte gemeinsam besprechen, wird das gar nicht so schwer.

# Hinweis
Grundlegend ist diese letzte Sektion nach dem fantastischen "Godot Beginner Tutorial" vom dänischen YouTube Kanal "Brackeys" aufgebaut. Solange Englisch kein Problem ist, würde ich dieses Video sehr empfehlen:
[![How to make a Video Game - Godot Beginner Tutorial](https://img.youtube.com/vi/LOhfqjmasi0/0.jpg)](https://www.youtube.com/watch?v=LOhfqjmasi0)


# Vorschau:
https://github.com/user-attachments/assets/7205aa1e-7706-45f7-bd82-ec35102aa07a

# Aufgabenplan
1. [Spieler-Controller](#1-spieler-controller) (gemeinsam) (26.02.)
2. [einfache Umgebung](#2-umgebung-erstellen-mit-tilesets) (gemeinsam) (05.03.)
3. [Hintergrund, hochladen auf GitHub](#3-hintergrund-hochladen-auf-github) (gemeinsam) (12.03.)
4. Eigene Sprites *Spieler und Umgebung* (gemeinsam) (12.03., 19.03.)
5. Gegner, Game Over (gemeinsam)
6. Weitere Gegner, eigener Game Over Bildschrim

# Erklärung
## 0. Grundlegendes
- Erstelle ein neues Godot-Projekt
- Erstelle eine 2D-Root-Node (Hauptszene, e.g. "main")
## 1. Spieler-Controller
- Erstelle eine Character-Body-2D-Szene (nenne sie e.g. "player")
### Animated-Sprite
- Füge dieser eine Animated-Sprite-2D-Node
- unter dem Punkt `Sprite-Frames` erstelle einen Neuen (Pfeil nach unten)
- Drücke auf diesen `Sprite-Frames`; ein Animations-Fenster sollte sich öffnen
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
### Die Camera dem Spieler folgen lassen
- Dazu muss die `Camera` einfach `Child-Node` der `Spieler-Szene` sein.
>[!Tip]
> Falls du das ganze etwas lebendiger haben willst, kannst du auf die Camera-Node klicken (links) und im Inspektor (rechts) `Position Smoothing` einschalten.
## 2. Umgebung erstellen (mit Tilesets)
- Füge eine Node vom Typ `TileMapLayer` hinzu
- Erstelle ein neues TileSet (wie bei den [Sprite Frames](#animated-sprite))
- Passe die Größe deines TileSets falls nötig an, indem du auf `TileSet` im Inspektor drückst.
- Füge unter TileSet im aufpoppended Menü (unten) deine TileMap hinzu (per Drag and drop)
- Es wird gefragt, ob du automatisch Tiles im Atlas erstellen willst: Drücke "ja"
- Passe `Seperation` und `Margins`, sowie falls nötig `Texture Region` an
- Füge im Inspektor unter `TileSet` nun ein `PhysicsLayer hinzu` (sodass der Spieler nicht durch den Boden fällt)
- Zurück im unteren Bildschirm, kannst du nun den `Paint` Tab wählen und das neue `Physics Layer` auswählen und die Objekte mit denen kollidiert werden soll anmalen.
- Sobald du fertig bist, wähle unten `TileMap`, wähle ein Tile aus, dass du willst und du kannst nun das Level malen
## 3. Hintergrund, hochladen auf GitHub
### Hintergrund
Um einen Hintergrund hinzuzufügen: 
- erstellt eine neue `TileMapLayer`-Node und nennt sie so etwas wie `Hintergrund`
- Im Inspektor unter `Ordering` setzt den Z-Index auf -1.
- Macht die neue `TileMapLayer`-Node eine `Child-Node` des Hauptlayers (drag and drop)
- Geht auf das Hauptlayer und unter `Tileset` klickt auf den Pfeil nach unten und wählt `speichern unter`
- Speichert die Datei am besten neben eurem TileSet-Bild
- In dem Hintergrund-Layer könnt ihr nun unter `Tileset` auf den Pfeil nach unten drücken und `Laden` auswählen
- Wählt hier nun das eben gespeicherte Tileset
- Nun könnt ihr wie zuvor malen, der Hintergrund erscheint nun aber hinter den Platformer und nicht auf der selben Ebene.
### GitHub
- [Einrichten von Access-Tokens](https://github.com/Informatik-AG-MPG/script?tab=readme-ov-file#access-tokens-f%C3%BCr-github-einrichten)
- [Hochladen auf GitHub](https://github.com/Informatik-AG-MPG/script?tab=readme-ov-file#typisches-arbeiten-mit-git)
- [Mögliche Probleme](https://github.com/Informatik-AG-MPG/script?tab=readme-ov-file#typisches-arbeiten-mit-git)
# Links zu kostenlosen Resourcen
Am Besten für Pixel-Art Hintergründe und Assets: https://rottingpixels.itch.io/ <br>
Fantastisch für Hintergründe und Assets: https://kenney.nl <br>
Hat zudem auch Spieler- und Gegner-Sprites: https://opengameart.org
>[!IMPORTANT]
> Achtet auf die Lizenz. CC0 bedeutet, keine Nennung ist nötig.
> Recherchiert bei allem Anderen, bevor ihr es veröffentlicht.

# Quellen
Von hier, stammen entweder die Sprites für das Spiel oder nützliches Wissen.
Vielen Dank an diejenigen die diese fantastischen Resourcen kostenlos und teils ohne Notwendigkeit eine Nennung bereitstellen.
## Sprites
https://rottingpixels.itch.io/nature-platformer-tileset <br>
https://opengameart.org/content/classic-hero-and-baddies-pack <br>
https://kenney.nl/assets/platformer-art-pixel-redux
## Wissen
[How to make a Video Game - Godot Beginner Tutorial - Brackeys](https://www.youtube.com/watch?v=LOhfqjmasi0) <br>
[Die Godot Docs](https://docs.godotengine.org/en/stable/) <br>
[r/godot](https://www.reddit.com/r/godot) <br>
[stackoverflow](https://stackoverflow.com/questions/61108940/how-to-make-camera-follow-player-in-godot)

# Über dieses Projekt
Das Ziel ist es, dass ihr euren eigenen Platformer (à la Mario Bros.) erstellt. Das wirkt zunächst, wie eine gigantische Aufgabe, aber mit dem was ihr bereits wisst und indem wir einige Schritte gemeinsam besprechen, wird das gar nicht so schwer.

# Hinweis
Grundlegend ist diese letzte Sektion nach dem fantastischen "Godot Beginner Tutorial" vom dänischen YouTube Kanal "Brackeys" aufgebaut. Solange Englisch kein Problem ist, würde ich dieses Video sehr empfehlen: [How to make a Video Game - Godot Beginner Tutorial](https://www.youtube.com/watch?v=LOhfqjmasi0).


# Vorschau:
https://github.com/user-attachments/assets/7205aa1e-7706-45f7-bd82-ec35102aa07a

# Aufgabenplan
1. [Spieler-Controller](#1-spieler-controller) (gemeinsam) [26.02.]
2. [einfache Umgebung](#2-umgebung-erstellen-mit-tilesets) (gemeinsam) [05.03.]
3. [Hintergrund, Killzone](#3-hintergrund-hochladen-auf-github) (gemeinsam) [12.03.]
4. [Gegner](#4-gegner) (gemeinsam) [19.03., 26.03.]
5. [Gewinnbedingung](#5-gewinnen) (gemeinsam)
6. [End Bildschirm](#6-end-bildschirm) (gemeinsam)
7. [Hochladen auf GitHub](#5-hochladen-auf-github) (gemeinsam/eigenständig)
8. Eigene Sprites *Spieler und Umgebung* (eigenständig)
9. Weitere Gegner, eigener Game Over Bildschrim (eigenständig)

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
### Killzone
- Erstelle eine neue Szene vom Typ "Area2D" (speichere sie unter `scenes`) und wähle `Collision Mask 1 und 2`
- Füge nun die Killzone-Szene in die Hauptszene (e.g. `main`), sowie eine `CollisionShape2D`-Node und eine `Timer`-Node als Child-Nodes
- Stelle bei dem Timer eine Wait Time ein, die dir passt.
- Nun, zurück in der Killzone-Szene fügt ein Skript hinzu:
```gdscript
extends Area2D

@onready var timer = $Timer

func _on_body_entered(_body):
	timer.start()
	
func _on_timer_timeout():
	get_tree().reload_current_scene()
```
Die beiden Funktionen sind dabei jeweils Signale. Das erste `on_body_entered` stammt von der `Killzone`, das zweite von dem `Timer`.

## 4. Gegner
WIP
## 5. Gewinnen
### Grundlegend
Bisher können wir das Spiel nur verlieren, aber nicht gewinnen. Ändern wir das!
- Erstellt zunächst eine `goal`-Szene (wobei die Root-Node hier vom Typ `Area2D` sein soll)
- Diese braucht eine `Sprite2D`-Node, eine `CollisionShape2D`-Node und eine `Timer`-Node
- Für den Sprite könnt ihr entweder eine eigene Grafik, wie eine Flagge, in GIMP zeichnen oder [meine](https://raw.githubusercontent.com/Informatik-AG-MPG/platformer/blob/main/assets/finish_level_thingy.png) (eher weniger gute) herunterladen.
- den `CollisionShape` zieht ihr nun so, dass er ungefähr so groß ist wie die Grafik. (Etwas größer ist hier besser, da das Ziel positiv für den Spieler ist und wir Frustration vermeiden wollen)
- Fügt nun zu der `goal`-Node (vom Typ `Area2D`) ein Skript hinzu. Dieses wird genauso funktionieren, wie das `Killzone`-Skript von vorher.
- Hier fügt ihr nun also zuerst die Timer-Node, als Variable mit dem `@onready`-Keyword hinzu, um später auf sie zuzugreifen.
- Dann fügt ihr 2 Signale: `_on_body_entered` und `_on_timer_timeout` hinzu. (Über den Signaltab.)
- `_on_body_entered` soll nun den Timer starten, wenn der Spieler die `Area2D` betritt.
- Sobald der Timer ausläuft soll dann der End-Bildschirm geladen werden. (Aber der kommt erst im nächsten Kapitel. Bis da hin, kannst du auch die aktuelle Szene neu laden.)
In Skriptform, sieht das dann so aus:
```gdscript
extends Area2D

@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
  # Falls der Spieler das Ziel betritt, starte den Timer
	if (body.name == "player"):
		timer.start()

func _on_timer_timeout() -> void:
	# Gehe zum Endbildschirm
	get_tree().change_scene_to_file("res://scenes/end.tscn")
```
### Gewinnbedingung
Wir können aber auch dafür sorgen, dass das Ziel nur erscheint, wenn man zuvor eine andere `Area2D` betreten hat. Grundsätzlich funktioniert das genau gleich, wie das normale Ziel. 

Aber damit der Spieler das Ziel überhaupt freischalten kann, muss es erstmal deaktiviert sein. Um das zu machen fügt folgendes zu dem Skript der `goal`-Node von vorher hinzu:
```gdscript
func _ready() -> void:
	# Verstecke das Ziel, sobald es verfügbar ist (es funktioniert aber nur)
	self.visible = false
	# Schalte die Funktion des Ziels aus.
	# Sonst würde es trotzdem funktionieren, was auch für interessantes Gameplay sorgen könnte.
	self.set_process(false)
```
Jetzt ist bis zu dem Skript alles gleich, beim Erstellen der Gewinnbedingungsszene. Den Timer würde ich hier aber weglassen, je nachdem wie eurer Level aufgebaut ist, könnt ihr den aber natürlich auch hinzufügen (müsst dann aber auch das Skript unten anpassen).
In dem Skript der Gewinnbedingungs-`Area2D` müssen wir das Ausschalten jetzt nur rückgänging machen, sobald der Spieler die `Area2D` betritt. Dazu nutzen wir wieder das `_on_body_entered`-Signal. Das sieht dann so aus:
```gdscript
extends Area2D

func _on_body_entered(body: Node2D) -> void:
	var goal: Area2D = $"../goal"
	if (body.name == "player"):
		# Zeige das Ziel
		goal.visible = true
		# Schalte das Ziel an
		goal.set_process(true)
```
## 6. End Bildschirm
## Funktionierende Knöpfe
Wenn der Spieler nun gewinnt, wollen wir natürlich auch, dass etwas passiert. Also zeigen wir einen Siegesbildschirm. Von der Programmierlogik funktioniert dieser genau wie unser [erstes eigenes Projekt](https://github.com/Informatik-AG-MPG/script#erstes-eigenes-projekt), also:
- Zunächst erstellt ihr eine neue Szene namens etwa `end.tscn`. 
- Zu dieser fügt ihr eine `Label`-Node und 2 `Button` Nodes hinzu. 
- Nun fügt ihr zu den beiden Knöpfen (den `Button` Nodes) ein Skript hinzu.
- In diesem Skript überprüft ihr nun den Namen eures Knopfes und führt je nachdem welcher Knopf gedrückt wurde eine andere Aktion aus (z.B.: Spiel beenden und Level wiederholen/nächstes Level laden).
>[!Tip]
>Falls dir die Schriftgröße oder Schriftart nicht passt, kannst du dies im Inspektor unter `Theme Overrides` anpassen.

Ein vollständiges Skript sieht dann zum Beispiel so aus:
```gdscript
extends Button

func _ready():
  # Falls der Knopf gedrückt wurde, rufe die _load_scene-Funktion auf
	pressed.connect(_load_scene)
	
func _load_scene():
  # Wenn der Knopf "restart_button" heißt, lade die main-Szene (also starte das Spiel neu)
	if (self.name == "restart_button"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	# Wenn der Knopf "quit_button" heißt, verlasse das Spiel.
	elif (self.name == "quit_button"):
		get_tree().quit()
```
## Ausrichtung der UI-Elemente
Die Knöpfe und der Text liegen jetzt aber irgendwie im Raum (oder sind zumindest nicht genau in der Mitte). Das können wir am Programmatisch anpassen.
- Fügt dazu der Root-Node eurer `end.tscn`-Szene ein Skript hinzu.
- Erstellt nun Variablen für jede Node die ihr ausrichten wollt und zieht hinter das `=` einfach die Node aus dem Scene-Tree per Drag-and-Drop.
- Dann fragt ihr den DisplayServer nach der Größe des Bildschirms / Fenster um daran die Position anzupassen
- Für die x-Koordinate können wir einfach die Bildschirmgröße / 2 - die Größe der Node / 2 nehmen um die Node zu zentrieren
- Für die y-Koordinate müssen wir einfach verschiedene Werte ausprobrieren durch die wir die Bildschirmgröße teilen (so dass die Node dann auf einer Höhe ist, die euch gefällt)
Das fertige Skript sieht dann z.B.: so aus:
```gdscript
extends Node2D

func _ready():
	# Variablen für alle Nodes
	var text: Label = $text
	var button_1 = $restart_button
	var button_2: Button = $quit_button
	
	# Bildschirmgröße bekommen (als 2D-Vektor)
	var screen_size = DisplayServer.window_get_size()
	
	# Nodes ausrichten
	# 32, 2 and 1.5 sind nur Werte, von denen ich glaube, dass sie gut aussehen.
	text.position = Vector2((screen_size.x/2 - text.size.x/2), screen_size.y/32)
	button_1.position = Vector2((screen_size.x/2 - button_1.size.x/2), screen_size.y/2)
	button_2.position = Vector2((screen_size.x/2 - button_2.size.x/2), screen_size.y/1.5)
```
## 7. Hochladen auf GitHub
Ladet nun euer Projekt mit eurem zuvor gelernten Wissen auf GitHub hoch. Hier, zur Erinnerung, die Links zu dem, was wir bereits aufgeschrieben haben.
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

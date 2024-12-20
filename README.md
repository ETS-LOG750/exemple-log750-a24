# Exemples pour le cours LOG750 (A2024)

Les code d'exemples sont visible dans le dossier `examples`.

Suivre les instructions sur ENA pour la mise en place de l'environment de travail:
- Windows: Visual Studio ou Visual Studio Code
- Linux: Visual Studio Code

**Version OpenGL**: 4.6 (certains exemples en 4.3)

## Cours 01 (OpenGL, imGUI)

- `01_imGUIDemo`: Demo de toutes les fonctionalités de imGUI. Code disponible: https://github.com/ocornut/imgui/blob/master/imgui_demo.cpp 

- `01_imGUIExample`: Demo simple de comment utiliser imGUI pour les laboratoires.

- `01_Triangles` : Application OpenGL (4.3) avec binding qui dessine deux triangles. les concepts couvert sont:
  - Création d'un shader simple (vertex avec une entrée, couleur de sortie fixe)
  - Création d'un VBO (contenant les positions en 2D) et VAO

- `01_Triangles_bindless` : Application **OpenGL (4.6)** identique à `01_Triangles` mais en utilisant DSA. Cet exemple est à privilégier. 

## Cours 02 (Couleur)

- `02_PositionAndColor`: Démo montrant comment utiliser un VBO et un VAO pour afficher des données par sommet coloré. Elle montre également comment utiliser des uniformes pour contrôler le comportement d’un nuanceur. 

- `02_PositionAndColor_ssbo`: Démo montrant l'utilisation de SSBO (Shader Storage Buffer Object) comme alternative au VBO/VAO. Cette fonctionalité est montrer dans un cas simple.

## Cours 03 (Éclairage)

- `03_LightingNoCamera` : Démo montrant comment le calcul d'éclairage peut être mener sur deux formes (cylindre ou patches de Bézier) avec différentes techniques.  

## Cours 04 (Transformation)

- `04_Transformation` : Démonstration de plusieurs combinaison de transformation (et application de celle-ci dans le nuanceur de sommet)
- `04_Animation` : Démonstration de la différence entre interpolation d'euler et quaternions (exemple avancé)

## Cours 05 (Modélisation)
- `05_DrawSquares` : Démonstration utiliser les différents mode de dessin en OpenGL (indexé, fan, ...)
- `05_GeometryShader` : Démonstration de l'utilisation d'un géometry shader pour calculer des information sur un maillage quelquonque.
- `05_TesselationTeaport` : Utilisation des surface de Bézier et d'un shader de tesselation. 

## Cours 06 (Caméra)
- `06_LightingCamera` : Démonstration de comment calculer l'éclairage dans l'espace caméra.
- `06_Unproject` : Code alternatif pour effectuer une opération de picking.

## Cours 08 (Animation)
- `08_Particules` : Démonstration de la simulation de particule avec compute shaders.

## Cours 09 (Textures)
- `09_Texture`: Démonstration de comment utiliser les textures en OpenGL.
- `09_Texture_bindless`: Méthode alternative pour la gestion des textures en OpenGL. 

## Cours 10 (Textures avancées)
- `10_Sky`: Démonstration d'un exemple de carte d'environement et du calcul de l'éclairage sur une sphère métalique.
- `10_NormalMap`: Démonstration du normal mapping sur un simple plan.
- `10_SimpleFBO`: Démonstration de l'utilisation d'un FBO pour capturer l'environement dans une texture. 
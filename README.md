# 📱 TP WhatsApp Clone — Flutter

> Reproduction fidèle des interfaces de WhatsApp réalisée dans le cadre d'un TP de développement d'applications mobiles.

---

## 📸 Aperçu

| Discussions | Appels | Actus | Chat |
|:-----------:|:------:|:-----:|:----:|
| Liste des conversations avec badges | Historique des appels audio/vidéo | Statuts et chaînes | Messagerie en temps réel |

---

## 🚀 Fonctionnalités

### Écran Discussions
- Liste des conversations avec avatar, nom, dernier message et heure
- Badge de messages non lus
- Icône épingle pour les conversations épinglées
- Double coche bleue pour les messages envoyés/lus
- Barre de recherche
- Filtres : Toutes, Non lues, Favoris, Groupes

### Écran Appels
- Historique des appels récents
- Différenciation : appels reçus 🟢, émis 🟢, manqués 🔴
- Support appels audio et vidéo
- 4 actions rapides : Appeler, Planifier, Clavier, Favoris

### Écran Actus
- Carousel horizontal des statuts contacts
- Bouton "Ajouter un statut"
- Liste des chaînes avec badges et aperçu

### Écran Chat (Discussion individuelle)
- Bulles de messages envoyés (droite, vert) et reçus (gauche, gris)
- Champ de saisie avec bouton envoi / micro
- Envoi de messages en temps réel
- Double coche bleue par message
- Boutons appel audio et vidéo dans l'AppBar

---

## 🏗️ Architecture du projet

```
lib/
├── main.dart
├── models/
│   ├── conversation.dart
│   ├── call.dart
│   ├── message.dart
│   └── actus.dart
├── data/
│   ├── conversations_data.dart
│   ├── calls_data.dart
│   ├── messages_data.dart
│   └── actus_data.dart
├── screens/
│   ├── home_screen.dart
│   ├── calls_screen.dart
│   ├── actus_screen.dart
│   └── chat_screen.dart
└── widgets/
    ├── chat_tile.dart
    └── call_tile.dart
```

---

## 🛠️ Technologies utilisées

- **Flutter** — Framework UI multiplateforme
- **Dart** — Langage de programmation
- **Material Design** — Composants UI

---

## ⚙️ Installation et lancement

### Prérequis
- Flutter SDK installé
- Un appareil ou émulateur disponible

### Lancer le projet

```bash
# Cloner le repository
git clone https://github.com/TON_USERNAME/tp_whatsapp_clone.git

# Aller dans le dossier
cd tp_whatsapp_clone

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

---

## 🎨 Design

- **Thème** : Dark mode complet
- **Couleur principale** : `#25D366` (vert WhatsApp)
- **Fond** : `#111111`
- **Bulles envoyées** : `#005C4B`
- **Bulles reçues** : `#1F2C34`

---

## 📋 Critères du TP couverts

| Critère | Statut |
|---------|--------|
| Écran Discussions | ✅ |
| Écran Appels | ✅ |
| Écran Statuts/Actus | ✅ |
| Écran Chat individuel | ✅ |
| Architecture propre | ✅ |
| Dark mode | ✅ (Bonus) |
| Navigation fluide | ✅ (Bonus) |
| Données mockées | ✅ |

---

## 👨‍💻 Auteur

**Aimeakd** — TP Développement Mobile  
Université / École — 2026

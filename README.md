# Scam Detect - Real-Time Scam Call Analysis 📞🚨

**Scam Detect** is a Flutter-based mobile application designed to **analyze incoming calls in real-time or post-call** to detect scam patterns using cutting-edge machine learning models. It empowers users to stay protected by alerting them about suspicious behavior, tone, or voice patterns, and allows them to **block** or **report scam calls** instantly.



---

## 📑 Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Architecture Overview](#architecture-overview)
- [Real-Time vs Post-Call Flow](#real-time-vs-post-call-flow)
- [Model Details](#model-details)
- [Setup Instructions](#setup-instructions)
- [Screenshots](#screenshots)

---

## 🚀 Features

- 🔴 **Real-Time Call Analysis** using Agora + Web Speech API
- 🎙️ **Post-Call Analysis** using Whisper for speech transcription
- 🤖 **Spam Detection** via BERT (classifies into Ham, Likely Spam, and Spam)
- 🧠 **Sentiment Analysis** for emotional tone detection (HuggingFace)
- 🔍 **Voice Recognition** using SpeechRecognition & acoustic features
- 📈 **Scam Cache** system trained on metadata of past scams
- 🔒 **Actions Panel**: Block Numbers & Report to Authorities
- 🎨 Clean UI with dynamic color-coded risk indicators (green/yellow/red)

---

## 🧰 Tech Stack

| Layer               | Technology / Tools                         |
|---------------------|---------------------------------------------|
| **Frontend**        | Flutter, Dart                               |
| **Live Transcription** | Agora SDK, Web Speech API               |
| **Post-Call STT**   | OpenAI Whisper                              |
| **NLP (Spam Detect)** | BERT via HuggingFace                     |
| **Sentiment Analysis** | HuggingFace Transformers               |
| **Voice Analysis**  | SpeechRecognition, Librosa (Python)         |
| **Model Hosting**   | HuggingFace Spaces, Flask/FastAPI (if needed) |
| **Deployment**      | Android / iOS                              |

---

## 🧠 Architecture Overview

```plaintext
 [ User Receives or Makes a Call ]
             |
      -------------------
     |                   |
[ In-App Call ]     [ External Call ]
     |                   |
[ Real-Time STT ]   [ Post-Call STT ]
(Web Speech API)       (Whisper)
     |                   |
      ------> Transcription Text
                     |
      ---------------------------------------
     |                                       |
[ BERT Spam Classifier ]        [ Sentiment & Voice Analysis ]
     |                                       |
     -------------> Final Risk Score (Red / Yellow / Green)
                               |
                     [ Display Analysis in UI ]
                               |
                  [ Block / Report / Feedback ]
```

---

## 🔄 Real-Time vs Post-Call Flow

### 🔹 Real-Time Analysis
- Triggered **only when call is made from within the app**
- Uses **Agora SDK** to stream audio
- **Web Speech API** processes transcription on the fly
- Immediate alerts to user based on scam likelihood

### 🔸 Post-Call Analysis
- Works with **calls made outside the app**
- Audio recording is transcribed using **OpenAI Whisper**
- NLP and sentiment models run after transcription for full analysis

---

## 🧬 Model Details

- **Spam Detection Model**  
  → Fine-tuned **BERT** model trained on call transcript datasets  
  → Output labels: `Ham`, `Likely Spam`, `Spam`

- **Sentiment Analysis Model**  
  → HuggingFace Transformers (BERT, RoBERTa-based)  
  → Detects tone: angry, urgent, fearful, neutral

- **Voice Analysis Model**  
  → Uses `SpeechRecognition`, `Librosa` for:
  - Stress levels
  - Voice match with scam databases
  - Background noise like call centers

- **Scam Cache**  
  → Uses metadata from previous scam cases (caller ID, frequency, duration)  
  → Boosts model accuracy using contextual history

---

## ⚙️ Setup Instructions

### ✅ Prerequisites
- Flutter SDK installed
- Android Studio or Xcode
- Agora Account for App ID
- HuggingFace Account (optional for hosted models)
- Python installed (for Whisper & backend models)

### 📦 Clone and Install

```bash
git clone https://github.com/your-username/scam-detect.git
cd scam-detect
flutter pub get
```

### 🔧 Agora Setup

- Create a project at [agora.io](https://www.agora.io/)
- Get your App ID
- Add it to `lib/config.dart` or `.env`

```dart
const String agoraAppId = 'YOUR_AGORA_APP_ID';
```

### ▶️ Run the App

```bash
flutter run
```

---

## 🖼️ Screenshots

![image](https://github.com/user-attachments/assets/d14d9f7d-f3a6-4387-9460-5b9621be2c06)
![image](https://github.com/user-attachments/assets/16ff9b44-593f-49d9-8a10-4a509dd85c4a)



---



---

## 🤝 Contributing

We welcome contributors!  
Please open an issue to discuss bugs, ideas, or improvements before submitting PRs.
